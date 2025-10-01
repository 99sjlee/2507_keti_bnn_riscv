#include "ervp_special_matrix_op.h"
#include "ervp_matrix_op_sw.h"
#include "ervp_matrix_op_transform.h"

ervp_task_wait_fx_t matrix_copy2copy_part_tf(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options)
{
  assert(matrix_compare_size(a, c));
  return mop_mapping->matrix_copy_part(mop_mapping, a, c, a->num_row, a->num_col, options);
}

ervp_task_wait_fx_t matrix_transpose2transpose_part_tf(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options)
{
  assert(a->num_row == c->num_col);
  assert(a->num_col == c->num_row);
  return mop_mapping->matrix_transpose_part(mop_mapping, a, c, a->num_row, a->num_col, options);
}

static inline int get_num_row_of_parted_input(int kernel_size, int num_row_of_parted_output)
{
  return num_row_of_parted_output + kernel_size - 1;
}

static inline int get_num_col_of_parted_input(int kernel_size, int num_col_of_parted_output)
{
  return num_col_of_parted_output + kernel_size - 1;
}

static inline int get_num_row_of_line_input(int kernel_size)
{
  return kernel_size;
}

static inline int get_num_col_of_line_input(int kernel_size, int tile_size)
{
  return tile_size + kernel_size - 1;
}

static inline int get_flatten_size(int kernel_size, int tile_size)
{
  return kernel_size * get_num_col_of_line_input(kernel_size, tile_size);
}

static int cal_tile_size(int hw_size, int kernel_size)
{
  assert((kernel_size * kernel_size) <= hw_size);
  int tile_size = 1;
  while (1)
  {
    int new_tile_size = tile_size << 1;
    int flatten_size = get_flatten_size(kernel_size, new_tile_size);
    if (flatten_size <= hw_size)
      tile_size = new_tile_size;
    else
      break;
  }
  return tile_size;
}

static ErvpMatrixInfo *generate_unrolled_kernel_matrix(const ErvpMatrixInfo *kernel_info, int hw_size, int tile_size)
{
  int kernel_size = kernel_info->num_col;
  int line_input_num_col = get_num_col_of_line_input(kernel_size, tile_size);
  int flatten_size = get_flatten_size(kernel_size, tile_size);

  ErvpMatrixInfo *unrolled_kernel_info = matrix_alloc(kernel_info->datatype, flatten_size, tile_size, NULL);
  matrix_zero_sw(unrolled_kernel_info);

  for (int i = 0; i < kernel_size; i++)
    for (int j = 0; j < kernel_size; j++)
    {
      UNKNOWN_TYPE temp = _matrix_read_element(kernel_info, i, j);
      for (int k = 0; k < tile_size; k++)
      {
        int col_index = k;
        int row_index = (line_input_num_col * i) + k + j;
        _matrix_write_element(unrolled_kernel_info, row_index, col_index, temp);
      }
    }
  // matrix_print(unrolled_kernel_info);

  return unrolled_kernel_info;
}

static void flatten_line_input(const ErvpMatrixInfo *line_input_info, ErvpMatrixInfo *input_buffer_info, int row_index)
{
  int col_index = 0;
  for (int i = 0; i < line_input_info->num_row; i++)
    for (int j = 0; j < line_input_info->num_col; j++)
    {
      UNKNOWN_TYPE temp = _matrix_read_element(line_input_info, i, j);
      _matrix_write_element(input_buffer_info, row_index, col_index++, temp);
    }
  for (; col_index < input_buffer_info->num_col; col_index++)
    matrix_write_fixed_element(input_buffer_info, row_index, col_index, 0);
}

ervp_task_wait_fx_t matrix_conv2mult_im2col(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int conv_options)
{
  // matrix_conv_size_print(input_info,kernel_info,output_info);

  void *kernel_info_list[1];
  void *output_info_list[1];
  kernel_info_list[0] = kernel_info;
  output_info_list[0] = output_info;
  return matrix_conv_sharedinput_im2col(mop_mapping, 1, input_info, kernel_info_list, output_info_list, conv_options);
}

// (hw_size + kernel_size - 1) x (tile_size + kernel_size - 1) -> (hw_size x tile_size)
// (hw_size x flatten_size) x (flatten_size x tile_size) = (hw_size x tile_size)
ervp_task_wait_fx_t matrix_conv2mult_v1_tf(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int conv_options)
{
  ervp_mconv_option_t conv_option;
  conv_option.value = conv_options;
  if (conv_option.br.performs_cliping || conv_option.br.rshift)
  {
    int datatype = matrix_datatype_is_float(output_info->datatype) ? MATRIX_DATATYPE_FLOAT32 : MATRIX_DATATYPE_SINT32;
    ErvpMatrixInfo *temp_info = matrix_alloc(datatype, output_info->num_row, output_info->num_col, NULL);

    ervp_mconv_option_t conv_only_option;
    conv_only_option.value = conv_options;
    conv_only_option.br.rshift = 0;
    conv_only_option.br.performs_cliping = 0;
    conv_only_option.br.acc = 0;
    matrix_conv2mult_v1_tf(mop_mapping, input_info, kernel_info, temp_info, conv_only_option.value);

    ervp_mop_option_t mop_option = mop_option_alloc(0);
    mop_option.br.rshift = conv_option.br.rshift;
    mop_option.br.performs_cliping = conv_option.br.performs_cliping;
    mop_option.br.acc = conv_option.br.acc;
    mop_mapping->matrix_perform_postprocess(mop_mapping, temp_info, output_info, mop_option.value);

    matrix_free(temp_info);
  }
  else
  {
    // assert(conv_option.br.rshift == 0);
    // assert(conv_option.br.performs_cliping == 0);

    int hw_size = conv_option.br.pretty_to_mult;
    assert(hw_size >= 8);
    int kernel_size = kernel_info->num_col;
    int tile_size = cal_tile_size(hw_size, kernel_size);

    int flatten_size = get_flatten_size(kernel_size, tile_size);
    ErvpMatrixInfo *unrolled_kernel_info = generate_unrolled_kernel_matrix(kernel_info, hw_size, tile_size);
    ErvpMatrixInfo *input_buffer_info = matrix_alloc(input_info->datatype, hw_size, flatten_size, NULL);
    assert(unrolled_kernel_info != NULL);
    assert(input_buffer_info != NULL);

    ErvpMatrixInfo parted_output_info;
    parted_output_info.datatype = output_info->datatype;
    parted_output_info.stride_ls3 = output_info->stride_ls3;

    ervp_mop_option_t mop_option = mop_option_alloc(0);
    mop_option.br.acc = conv_option.br.acc;

    if (conv_option.br.acc == 0)
      mop_mapping->matrix_zero(mop_mapping, output_info);

    for (int i = 0; i < output_info->num_row; i += hw_size)
    {
      for (int j = 0; j < output_info->num_col; j += tile_size)
      {
        int is_boundary = 0;

        int num_row = output_info->num_row - i;
        if (num_row >= hw_size)
          num_row = hw_size;
        else
          is_boundary = 1;

        int num_col = output_info->num_col - j;
        if (num_col >= tile_size)
          num_col = tile_size;
        else
          is_boundary = 1;

        if (is_boundary && (!conv_option.br.boundary_to_mult))
        {
          ErvpMatrixInfo parted_input_info;
          parted_input_info.datatype = input_info->datatype;
          parted_input_info.stride_ls3 = input_info->stride_ls3;
          parted_input_info.num_row = get_num_row_of_parted_input(kernel_size, num_row);
          parted_input_info.num_col = get_num_col_of_parted_input(kernel_size, num_col);
          parted_input_info.addr = matrix_get_element_addr(input_info, i, j);
          parted_output_info.num_row = num_row;
          parted_output_info.num_col = num_col;
          parted_output_info.addr = matrix_get_element_addr(output_info, i, j);
          matrix_conv_sw(&parted_input_info, kernel_info, &parted_output_info, conv_option.value);
        }
        else
        {
          ErvpMatrixInfo line_input_info;
          line_input_info.datatype = input_info->datatype;
          line_input_info.stride_ls3 = input_info->stride_ls3;
          line_input_info.num_row = get_num_row_of_line_input(kernel_size);
          line_input_info.num_col = get_num_col_of_line_input(kernel_size, tile_size);
          input_buffer_info->num_row = num_row;
          for (int k = 0; k < num_row; k++)
          {
            line_input_info.addr = matrix_get_element_addr(input_info, i + k, j);
            flatten_line_input(&line_input_info, input_buffer_info, k);
          }
          unrolled_kernel_info->num_col = num_col;
          parted_output_info.num_row = num_row;
          parted_output_info.num_col = num_col;
          parted_output_info.addr = matrix_get_element_addr(output_info, i, j);
          mop_mapping->matrix_mult(mop_mapping, input_buffer_info, unrolled_kernel_info, &parted_output_info, mop_option.value);
        }
      }
    }
    matrix_free(unrolled_kernel_info);
    matrix_free(input_buffer_info);
    mop_option_free(mop_option);
  }
  return NULL;
}

ervp_task_wait_fx_t matrix_perform_postprocess_tf(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options)
{
  assert(mop_mapping);
  ervp_mop_option_t mop_option = mop_option_alloc(options);
  ervp_task_wait_fx_t task_wait_fx = NULL;
  if (mop_option.br.rshift || mop_option.br.performs_cliping)
  {
    assert(!matrix_datatype_is_float(a->datatype));
    for (int i = 0; i < a->num_row; i++)
    {
      for (int j = 0; j < a->num_col; j++)
      {
        int result = matrix_read_fixed_element(a, i, j);
        result = _melement_perform_rshift_and_clip(result, mop_option.br.rshift, mop_option.br.performs_cliping, c->datatype);
        if (mop_option.br.acc)
          result += matrix_read_fixed_element(c, i, j);
        matrix_write_fixed_element(c, i, j, result);
      }
    }
    c->is_binary = 0;
  }
  else
  {
    if (mop_option.br.acc)
    {
      assert(a != c);
      task_wait_fx = mop_mapping->matrix_add(mop_mapping, a, c, c, 0);
    }
    else
    {
      if (a != c)
        task_wait_fx = mop_mapping->matrix_copy(mop_mapping, a, c, 0);
    }
  }
  return task_wait_fx;
}

ervp_task_wait_fx_t matrix_conv_sharedinput_tf(ervp_mop_mapping_t *mop_mapping, int num_output, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo **output_info_list, int conv_options)
{
  ervp_task_wait_fx_t task_wait_fx = NULL;
  for (int i = 0; i < num_output; i++)
    mop_mapping->matrix_conv(mop_mapping, input_info, kernel_info_list[i], output_info_list[i], conv_options);
  return task_wait_fx;
}

ervp_task_wait_fx_t matrix_conv_sharedoutput_tf(ervp_mop_mapping_t *mop_mapping, int num_input, const ErvpMatrixInfo **input_info_list, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo *output_info, int conv_options, int init_ouptut)
{
  ervp_mconv_option_t conv_option;
  conv_option.value = conv_options;
  assert(conv_option.br.acc);
  ervp_task_wait_fx_t task_wait_fx = NULL;
  if (init_ouptut)
    task_wait_fx = mop_mapping->matrix_zero(mop_mapping, output_info);
  for (int i = 0; i < num_input; i++)
  {
    task_wait_finish(task_wait_fx);
    task_wait_fx = mop_mapping->matrix_conv(mop_mapping, input_info_list[i], kernel_info_list[i], output_info, conv_options);
  }
  return task_wait_fx;
}

static void _im2col_reordering(
    const ErvpMatrixInfo *input,
    int kernel_h, int kernel_w,
    int pad_h, int pad_w,
    int stride_h, int stride_w,
    ErvpMatrixInfo *output)
{
  int in_h = input->num_row;
  int in_w = input->num_col;

  int out_h = (in_h + 2 * pad_h - kernel_h) / stride_h + 1;
  int out_w = (in_w + 2 * pad_w - kernel_w) / stride_w + 1;

  int patch_size = kernel_h * kernel_w;

  for (int oh = 0; oh < out_h; ++oh)
  {
    for (int ow = 0; ow < out_w; ++ow)
    {
      int patch_col = oh * out_w + ow;
      int patch_row = 0;

      for (int kh = 0; kh < kernel_h; ++kh)
      {
        for (int kw = 0; kw < kernel_w; ++kw)
        {
          int ih = oh * stride_h + kh - pad_h;
          int iw = ow * stride_w + kw - pad_w;

          int val = 0;
          if (ih >= 0 && ih < in_h && iw >= 0 && iw < in_w)
          {
            val = matrix_read_fixed_element(input, ih, iw);
          }

          matrix_write_fixed_element(output, patch_row, patch_col, val);
          patch_row++;
        }
      }
    }
  }
}

ervp_task_wait_fx_t matrix_conv_sharedinput_im2col(ervp_mop_mapping_t *mop_mapping, int num_output, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo **output_info_list, int conv_options)
{
  // printf_function();
  assert(matrix_has_simple_layout(kernel_info_list[0]));
  assert(matrix_has_simple_layout(output_info_list[0]));

  ervp_task_wait_fx_t task_wait_fx = NULL;

  int flatten_kernel_size = matrix_num_elements(kernel_info_list[0]);
  ErvpMatrixInfo *flattened_kernel_info = matrix_generate_info(kernel_info_list[0]->datatype, num_output, flatten_kernel_size, kernel_info_list[0]->addr, NULL);
  if (num_output > 1)
    matrix_set_stride(flattened_kernel_info, (kernel_info_list[1]->addr - kernel_info_list[0]->addr));

  ErvpMatrixInfo *merged_output_info = matrix_generate_info(output_info_list[0]->datatype, num_output, matrix_num_elements(output_info_list[0]), output_info_list[0]->addr, NULL);
  if (num_output > 1)
    matrix_set_stride(merged_output_info, (output_info_list[1]->addr - output_info_list[0]->addr));

  ErvpMatrixInfo *reordered_input_info = matrix_alloc(input_info->datatype, flatten_kernel_size, matrix_num_elements(output_info_list[0]), NULL);

  ervp_mconv_option_t conv_option;
  conv_option.value = conv_options;
  _im2col_reordering(input_info, kernel_info_list[0]->num_row, kernel_info_list[0]->num_col, conv_option.br.pad, conv_option.br.pad, conv_option.br.stride_m1 + 1, conv_option.br.stride_m1 + 1, reordered_input_info);

  ervp_mop_option_t mop_option;
  mop_option.value = 0;
  mop_option.br.acc = conv_option.br.acc;
  mop_option.br.performs_cliping = conv_option.br.performs_cliping;
  mop_option.br.rshift = conv_option.br.rshift;

  // matrix_mult_size_print(flattened_kernel_info, reordered_input_info, merged_output_info);
  task_wait_fx = mop_mapping->matrix_mult(mop_mapping, flattened_kernel_info, reordered_input_info, merged_output_info, mop_option.value);
  // matrix_mult_sw(flattened_kernel_info, reordered_input_info, merged_output_info, mop_option.value);

  return task_wait_fx;
}

ervp_task_wait_fx_t matrix_zero2fill_tf(ervp_mop_mapping_t *mop_mapping, ErvpMatrixInfo *result)
{
  return mop_mapping->matrix_fill_fixed(mop_mapping, result, 0);
}

ervp_task_wait_fx_t matrix_one2fill_tf(ervp_mop_mapping_t *mop_mapping, ErvpMatrixInfo *result)
{
  return mop_mapping->matrix_fill_fixed(mop_mapping, result, 1);
}
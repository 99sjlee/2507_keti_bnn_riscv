#include "ervp_assert.h"
#include "ervp_printf.h"
#include "ervp_misc_util.h"
#include "ervp_blocked_matrix_op.h"
#include "ervp_matrix_op.h"
#include "ervp_matrix_op_sw.h"
#include "ervp_special_matrix_op.h"
#include "ervp_matrix_element.h"

ervp_task_wait_fx_t blocked_matrix_mult(ervp_blocked_matrix_info_t *blocked_info, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options)
{
  assert(blocked_info);
  assert(blocked_info->subop_mapping);

  // printf_function();
  //  matrix_mult_size_print(a, b, c);

  // matrix_print_brief(a);
  // matrix_print_brief(b);
  // matrix_print_brief(c);

  ervp_task_wait_fx_t task_wait_fx = NULL;
  ErvpMatrixInfo block_a = *a;
  ErvpMatrixInfo block_b = *b;
  ErvpMatrixInfo block_c = *c;

  const int HAS_POST_PROCESS = mop_option_has_postprocess(options);

  const int block_size = blocked_info->block_size;
  ErvpMatrixInfo *temp_buffer = NULL; // due to overflow
  if (HAS_POST_PROCESS)
  {
    int datatype = matrix_datatype_is_float(c->datatype) ? MATRIX_DATATYPE_FLOAT32 : MATRIX_DATATYPE_SINT32;
    temp_buffer = matrix_alloc(datatype, block_size, block_size, NULL);
  }

  for (int m = 0; m < a->num_row; m += block_size)
  {
    int remain_row = a->num_row - m;
    if (remain_row >= block_size)
      remain_row = block_size;
    block_a.num_row = remain_row;
    block_c.num_row = remain_row;

    for (int n = 0; n < b->num_col; n += block_size)
    {
      int remain_col = b->num_col - n;
      if (remain_col >= block_size)
        remain_col = block_size;
      block_b.num_col = remain_col;
      block_c.num_col = remain_col;

      block_c.addr = matrix_get_element_addr(c, m, n);

      if (HAS_POST_PROCESS)
      {
        temp_buffer->num_row = block_c.num_row;
        temp_buffer->num_col = block_c.num_col;
        // matrix_zero_sw(temp_buffer);
        task_wait_finish(task_wait_fx);
        task_wait_fx = blocked_info->subop_mapping->matrix_zero(blocked_info->subop_mapping, temp_buffer);
      }
      else if (!mop_option_is_acc(options))
      {
        // matrix_zero_sw(&block_c);
        task_wait_fx = blocked_info->subop_mapping->matrix_zero(blocked_info->subop_mapping, &block_c);
      }

      for (int k = 0; k < a->num_col; k += block_size)
      {
        int remain_product = a->num_col - k;
        if (remain_product >= block_size)
          remain_product = block_size;
        block_a.num_col = remain_product;
        block_b.num_row = remain_product;

        block_a.addr = matrix_get_element_addr(a, m, k);
        block_b.addr = matrix_get_element_addr(b, k, n);

        task_wait_finish(task_wait_fx);
        if (HAS_POST_PROCESS)
          task_wait_fx = blocked_info->subop_mapping->matrix_mult(blocked_info->subop_mapping, &block_a, &block_b, temp_buffer, mop_option_acc_only());
        else
          task_wait_fx = blocked_info->subop_mapping->matrix_mult(blocked_info->subop_mapping, &block_a, &block_b, &block_c, mop_option_acc_only());
      }
      if (HAS_POST_PROCESS)
      {
        task_wait_finish(task_wait_fx);
        task_wait_fx = blocked_info->subop_mapping->matrix_perform_postprocess(blocked_info->subop_mapping, temp_buffer, &block_c, options);
      }
    }
  }
  if (temp_buffer)
  {
    task_wait_finish(task_wait_fx);
    matrix_free(temp_buffer);
    task_wait_fx = NULL;
  }
  return task_wait_fx;
}

ervp_task_wait_fx_t blocked_matrix_add(ervp_blocked_matrix_info_t *blocked_info, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options)
{
  assert(blocked_info);
  assert(blocked_info->subop_mapping);

  ervp_task_wait_fx_t task_wait_fx = NULL;
  ErvpMatrixInfo block_a = *a;
  ErvpMatrixInfo block_b = *b;
  ErvpMatrixInfo block_c = *c;
  int block_size = blocked_info->block_size;

  for (int m = 0; m < a->num_row; m += block_size)
  {
    int remain_row = a->num_row - m;
    if (remain_row >= block_size)
      remain_row = block_size;
    block_a.num_row = remain_row;
    block_b.num_row = remain_row;
    block_c.num_row = remain_row;

    for (int n = 0; n < a->num_col; n += block_size)
    {
      int remain_col = a->num_col - n;
      if (remain_col >= block_size)
        remain_col = block_size;
      block_a.num_col = remain_col;
      block_b.num_col = remain_col;
      block_c.num_col = remain_col;

      block_a.addr = matrix_get_element_addr(a, m, n);
      block_b.addr = matrix_get_element_addr(b, m, n);
      block_c.addr = matrix_get_element_addr(c, m, n);

      task_wait_fx = blocked_info->subop_mapping->matrix_add(blocked_info->subop_mapping, &block_a, &block_b, &block_c, options);
    }
  }
  return task_wait_fx;
}

ervp_task_wait_fx_t blocked_matrix_sub(ervp_blocked_matrix_info_t *blocked_info, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options)
{
  assert(blocked_info);
  assert(blocked_info->subop_mapping);

  ervp_task_wait_fx_t task_wait_fx = NULL;
  ErvpMatrixInfo block_a = *a;
  ErvpMatrixInfo block_b = *b;
  ErvpMatrixInfo block_c = *c;
  ervp_mop_option_t mop_option = mop_option_alloc(options);
  int block_size = blocked_info->block_size;

  for (int m = 0; m < a->num_row; m += block_size)
  {
    int remain_row = a->num_row - m;
    if (remain_row >= block_size)
      remain_row = block_size;
    block_a.num_row = remain_row;
    block_b.num_row = remain_row;
    block_c.num_row = remain_row;

    for (int n = 0; n < a->num_col; n += block_size)
    {
      int remain_col = a->num_col - n;
      if (remain_col >= block_size)
        remain_col = block_size;
      block_a.num_col = remain_col;
      block_b.num_col = remain_col;
      block_c.num_col = remain_col;

      block_a.addr = matrix_get_element_addr(a, m, n);
      block_b.addr = matrix_get_element_addr(b, m, n);
      block_c.addr = matrix_get_element_addr(c, m, n);

      task_wait_fx = blocked_info->subop_mapping->matrix_sub(blocked_info->subop_mapping, &block_a, &block_b, &block_c, options);
    }
  }
  mop_option_free(mop_option);
  return task_wait_fx;
}

ervp_task_wait_fx_t blocked_matrix_ewmult(ervp_blocked_matrix_info_t *blocked_info, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options)
{
  assert(blocked_info);
  assert(blocked_info->subop_mapping);

  ervp_task_wait_fx_t task_wait_fx = NULL;
  ErvpMatrixInfo block_a = *a;
  ErvpMatrixInfo block_b = *b;
  ErvpMatrixInfo block_c = *c;
  int block_size = blocked_info->block_size;

  for (int m = 0; m < a->num_row; m += block_size)
  {
    int remain_row = a->num_row - m;
    if (remain_row >= block_size)
      remain_row = block_size;
    block_a.num_row = remain_row;
    block_b.num_row = remain_row;
    block_c.num_row = remain_row;

    for (int n = 0; n < a->num_col; n += block_size)
    {
      int remain_col = a->num_col - n;
      if (remain_col >= block_size)
        remain_col = block_size;
      block_a.num_col = remain_col;
      block_b.num_col = remain_col;
      block_c.num_col = remain_col;

      block_a.addr = matrix_get_element_addr(a, m, n);
      block_b.addr = matrix_get_element_addr(b, m, n);
      block_c.addr = matrix_get_element_addr(c, m, n);

      task_wait_fx = blocked_info->subop_mapping->matrix_ewmult(blocked_info->subop_mapping, &block_a, &block_b, &block_c, options);
    }
  }
  return task_wait_fx;
}

ervp_task_wait_fx_t blocked_matrix_conv(ervp_blocked_matrix_info_t *blocked_info, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int conv_options)
{
  assert(blocked_info);
  assert(blocked_info->subop_mapping);

  // printf_function();

  // matrix_conv_size_print(input_info,kernel_info,output_info);

  ervp_task_wait_fx_t task_wait_fx = NULL;
  ErvpMatrixInfo block_i = *input_info;
  ErvpMatrixInfo block_o = *output_info;
  int input_block_size = blocked_info->block_size;
  assert(kernel_info->num_row == kernel_info->num_col);
  int output_block_size = matrix_conv_output_rows(input_block_size, kernel_info->num_row, conv_options);

  for (int m = 0; m < input_info->num_row - (input_block_size - output_block_size); m += output_block_size)
  {
    int remain_row = input_info->num_row - m;
    if (remain_row >= input_block_size)
      remain_row = input_block_size;
    block_i.num_row = remain_row;
    block_o.num_row = matrix_conv_output_rows(remain_row, kernel_info->num_row, conv_options);

    for (int n = 0; n < input_info->num_col - (input_block_size - output_block_size); n += output_block_size)
    {
      int remain_col = input_info->num_col - n;
      if (remain_col >= input_block_size)
        remain_col = input_block_size;
      block_i.num_col = remain_col;
      block_o.num_col = matrix_conv_output_cols(remain_col, kernel_info->num_row, conv_options);

      block_i.addr = matrix_get_element_addr(input_info, m, n);
      block_o.addr = matrix_get_element_addr(output_info, m, n);

      // matrix_conv_size_print(&block_i,kernel_info,&block_o);
      task_wait_fx = blocked_info->subop_mapping->matrix_conv(blocked_info->subop_mapping, &block_i, kernel_info, &block_o, conv_options);
    }
  }
  return task_wait_fx;
}

ervp_task_wait_fx_t blocked_matrix_conv_sharedinput(ervp_blocked_matrix_info_t *blocked_info, int num_output, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo **output_info_list, int conv_options)
{
  assert(blocked_info);
  assert(blocked_info->subop_mapping);

  ervp_task_wait_fx_t task_wait_fx = NULL;

  int input_block_size = blocked_info->block_size;
  int kernel_size = kernel_info_list[0]->num_row;
  int output_block_size = matrix_conv_output_rows(input_block_size, kernel_size, conv_options);

  ErvpMatrixInfo **output_block_info_list;
  output_block_info_list = malloc(sizeof(ErvpMatrixInfo *) * num_output);
  for (int i = 0; i < num_output; i++)
    output_block_info_list[i] = matrix_generate_submatrix_info(output_info_list[i], NULL);

  ErvpMatrixInfo block_i = *input_info;
  for (int m = 0; m < input_info->num_row - (input_block_size - output_block_size); m += output_block_size)
  {
    int remain_row = input_info->num_row - m;
    if (remain_row >= input_block_size)
      remain_row = input_block_size;
    block_i.num_row = remain_row;

    for (int n = 0; n < input_info->num_col - (input_block_size - output_block_size); n += output_block_size)
    {
      int remain_col = input_info->num_col - n;
      if (remain_col >= input_block_size)
        remain_col = input_block_size;
      block_i.num_col = remain_col;
      block_i.addr = matrix_get_element_addr(input_info, m, n);

      for (int i = 0; i < num_output; i++)
      {
        output_block_info_list[i]->num_row = matrix_conv_output_rows(remain_row, kernel_size, conv_options);
        output_block_info_list[i]->num_col = matrix_conv_output_cols(remain_col, kernel_size, conv_options);
        output_block_info_list[i]->addr = matrix_get_element_addr(output_info_list[i], m, n);
      }
      task_wait_fx = blocked_info->subop_mapping->matrix_conv_sharedinput(blocked_info->subop_mapping, num_output, &block_i, kernel_info_list, output_block_info_list, conv_options);
    }
  }
  matrix_list_free(output_block_info_list, num_output);

  return task_wait_fx;
}

ervp_task_wait_fx_t blocked_matrix_conv_sharedoutput(ervp_blocked_matrix_info_t *blocked_info, int num_input, const ErvpMatrixInfo **input_info_list, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo *output_info, int conv_options, int init_ouptut)
{
  assert(blocked_info);
  assert(blocked_info->subop_mapping);

  ervp_task_wait_fx_t task_wait_fx = NULL;

  int input_block_size = blocked_info->block_size;
  int kernel_size = kernel_info_list[0]->num_row;
  int output_block_size = matrix_conv_output_rows(input_block_size, kernel_size, conv_options);

  ErvpMatrixInfo **input_block_info_list;
  input_block_info_list = malloc(sizeof(ErvpMatrixInfo *) * num_input);
  for (int i = 0; i < num_input; i++)
    input_block_info_list[i] = matrix_generate_submatrix_info(input_info_list[i], NULL);

  const ErvpMatrixInfo *input_info = input_info_list[0];
  ErvpMatrixInfo block_o = *output_info;
  for (int m = 0; m < input_info->num_row - (input_block_size - output_block_size); m += output_block_size)
  {
    int remain_row = input_info->num_row - m;
    if (remain_row >= input_block_size)
      remain_row = input_block_size;
    block_o.num_row = matrix_conv_output_rows(remain_row, kernel_size, conv_options);

    for (int n = 0; n < input_info->num_col - (input_block_size - output_block_size); n += output_block_size)
    {
      int remain_col = input_info->num_col - n;
      if (remain_col >= input_block_size)
        remain_col = input_block_size;
      block_o.num_col = matrix_conv_output_cols(remain_col, kernel_size, conv_options);
      block_o.addr = matrix_get_element_addr(output_info, m, n);

      for (int i = 0; i < num_input; i++)
      {
        input_block_info_list[i]->num_row = remain_row;
        input_block_info_list[i]->num_col = remain_col;
        input_block_info_list[i]->addr = matrix_get_element_addr(input_info_list[i], m, n);
      }
      task_wait_fx = blocked_info->subop_mapping->matrix_conv_sharedoutput(blocked_info->subop_mapping, num_input, input_block_info_list, kernel_info_list, &block_o, conv_options, init_ouptut);
    }
  }

  matrix_list_free(input_block_info_list, num_input);

  return task_wait_fx;
}

ervp_task_wait_fx_t blocked_matrix_conv_sharedoutput_old(ervp_blocked_matrix_info_t *blocked_info, int num_input, const ErvpMatrixInfo **input_info_list, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo *output_info, int conv_options, int init_ouptut)
{
  assert(blocked_info);
  assert(blocked_info->subop_mapping);

  ervp_mconv_option_t conv_option;
  conv_option.value = conv_options;
  assert(conv_option.br.acc);
  ervp_task_wait_fx_t task_wait_fx = NULL;
  if (init_ouptut)
    task_wait_fx = blocked_info->subop_mapping->matrix_zero(blocked_info->subop_mapping, output_info);
  for (int i = 0; i < num_input; i++)
  {
    task_wait_finish(task_wait_fx);
    task_wait_fx = blocked_matrix_conv(blocked_info, input_info_list[i], kernel_info_list[i], output_info, conv_options);
  }
  return task_wait_fx;
}
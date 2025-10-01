#include "ervp_matrix_op_sw.h"
#include "ervp_special_matrix_op.h"
#include "ervp_math.h"

ervp_task_wait_fx_t _matrix_add_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options)
{
  int datatype = a->datatype;
  assert(datatype != MATRIX_DATATYPE_UINT32);
  assert(b->datatype != MATRIX_DATATYPE_UINT32);
  assert(c->datatype != MATRIX_DATATYPE_UINT32);
  assert(matrix_compare_size(a, b));
  assert(matrix_compare_size(a, c));
  if (datatype == MATRIX_DATATYPE_FLOAT32)
    matrix_add_float_sw(a, b, c, options);
  else
    matrix_add_fixed_sw(a, b, c, options);
  return NULL;
}

ervp_task_wait_fx_t _matrix_sub_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options)
{
  int datatype = a->datatype;
  assert(datatype != MATRIX_DATATYPE_UINT32);
  assert(b->datatype != MATRIX_DATATYPE_UINT32);
  assert(c->datatype != MATRIX_DATATYPE_UINT32);
  assert(matrix_compare_size(a, b));
  assert(matrix_compare_size(a, c));
  if (datatype == MATRIX_DATATYPE_FLOAT32)
    matrix_sub_float_sw(a, b, c, options);
  else
    matrix_sub_fixed_sw(a, b, c, options);
  return NULL;
}

ervp_task_wait_fx_t _matrix_ewmult_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options)
{
  int datatype = a->datatype;
  assert(datatype != MATRIX_DATATYPE_UINT32);
  assert(b->datatype != MATRIX_DATATYPE_UINT32);
  assert(c->datatype != MATRIX_DATATYPE_UINT32);
  assert(matrix_compare_size(a, b));
  assert(matrix_compare_size(a, c));
  if (datatype == MATRIX_DATATYPE_FLOAT32)
    matrix_ewmult_float_sw(a, b, c, options);
  else
    matrix_ewmult_fixed_sw(a, b, c, options);
  return NULL;
}

ervp_task_wait_fx_t _matrix_mult_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options)
{
  int datatype = a->datatype;
  assert(datatype != MATRIX_DATATYPE_UINT32);
  assert(b->datatype != MATRIX_DATATYPE_UINT32);
  assert(c->datatype != MATRIX_DATATYPE_UINT32);
  assert(a->num_col == b->num_row);
  assert(a->num_row == c->num_row);
  assert(b->num_col == c->num_col);
  if (datatype == MATRIX_DATATYPE_FLOAT32)
    matrix_mult_float_sw(a, b, c, options);
  else
    matrix_mult_fixed_sw(a, b, c, options);
  return NULL;
}

static ervp_task_wait_fx_t __matrix_copy_part_sw(const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options)
{
  assert(_mop_option_check(c, options));
  assert(mop_option_is_acc(options) == 0);
  ervp_mop_option_t mop_option = mop_option_alloc(options);
  for (int i = 0; i < num_row; i++)
    for (int j = 0; j < num_col; j++)
    {
      UNKNOWN_TYPE data = _matrix_read_element(a, i, j);
      if (mop_option_has_postprocess(options))
        data.value_signed = _melement_perform_rshift_and_clip(data.value_signed, mop_option.br.rshift, mop_option.br.performs_cliping, c->datatype);
      _matrix_write_element(c, i, j, data);
    }
  c->is_binary = a->is_binary;
  mop_option_free(mop_option);
  return NULL;
}

ervp_task_wait_fx_t _matrix_copy_part_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options)
{
  _matrix_check_copy_part(a, c, num_row, num_col, options);
  return __matrix_copy_part_sw(a, c, num_row, num_col, options);
}

static ervp_task_wait_fx_t __matrix_transpose_part_sw(const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options)
{
  assert(_mop_option_check(c, options));
  assert(mop_option_is_acc(options) == 0);
  ervp_mop_option_t mop_option = mop_option_alloc(options);
  for (int i = 0; i < num_row; i++)
    for (int j = 0; j < num_col; j++)
    {
      UNKNOWN_TYPE data = _matrix_read_element(a, i, j);
      if (mop_option_has_postprocess(options))
        data.value_signed = _melement_perform_rshift_and_clip(data.value_signed, mop_option.br.rshift, mop_option.br.performs_cliping, c->datatype);
      _matrix_write_element(c, j, i, data);
    }
  c->is_binary = a->is_binary;
  mop_option_free(mop_option);
  return NULL;
}

ervp_task_wait_fx_t _matrix_transpose_part_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options)
{
  _matrix_check_transpose_part(a, c, num_row, num_col, options);
  return __matrix_transpose_part_sw(a, c, num_row, num_col, options);
}

ervp_task_wait_fx_t _matrix_conv_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int options)
{
  int datatype = input_info->datatype;
  assert(datatype != MATRIX_DATATYPE_UINT32);
  assert(input_info->datatype != MATRIX_DATATYPE_UINT32);
  assert(kernel_info->datatype != MATRIX_DATATYPE_UINT32);
  assert(output_info->datatype != MATRIX_DATATYPE_UINT32);
  int is_float = matrix_datatype_is_float(input_info->datatype);
  assert(is_float == matrix_datatype_is_float(output_info->datatype));

  if (is_float)
    matrix_conv_float_sw(input_info, kernel_info, output_info, options);
  else
    matrix_conv_fixed_sw(input_info, kernel_info, output_info, options);
  return NULL;
}

ervp_task_wait_fx_t _matrix_shift_fixed_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, int shamount, ErvpMatrixInfo *c, int options)
{
  assert(!matrix_datatype_is_float(a->datatype));
  ervp_mop_option_t mop_option = mop_option_alloc(options);
  for (int i = 0; i < a->num_row; i++)
  {
    for (int j = 0; j < a->num_col; j++)
    {
      int result = matrix_read_fixed_element(a, i, j);
      if (shamount >= 0)
        result = result << shamount;
      else
        result = result >> (-shamount);
      result = _melement_perform_rshift_and_clip(result, mop_option.br.rshift, mop_option.br.performs_cliping, c->datatype);
      if (mop_option.br.acc)
        result += matrix_read_fixed_element(c, i, j);
      matrix_write_fixed_element(c, i, j, result);
    }
  }
  c->is_binary = 0;
  mop_option_free(mop_option);
  return NULL;
}

ervp_task_wait_fx_t _matrix_pad_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, ervp_mpad_option_t* option_ptr)
{
  assert(0);
}

ervp_task_wait_fx_t _matrix_reshape_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options)
{
  assert(a != NULL);
  assert(c != NULL);
  assert(matrix_num_elements(a) == matrix_num_elements(c));
  assert(matrix_datatype_is_float(a->datatype) == matrix_datatype_is_float(c->datatype));
  assert(_mop_option_check(c, options));

  ervp_mop_option_t mop_option = mop_option_alloc(options);
  int m = 0;
  int n = 0;
  for (int i = 0; i < a->num_row; i++)
    for (int j = 0; j < a->num_col; j++)
    {
      UNKNOWN_TYPE data = _matrix_read_element(a, i, j);
      if (!matrix_datatype_is_float(a->datatype) && options)
        if ((!matrix_datatype_is_float(a->datatype)) && options)
          data.value_signed = _melement_perform_rshift_and_clip(data.value_signed, mop_option.br.rshift, mop_option.br.performs_cliping, c->datatype);
      _matrix_write_element(c, m, n, data);
      n++;
      if (n == c->num_col)
      {
        m++;
        n = 0;
      }
    }
  c->is_binary = a->is_binary;
  mop_option_free(mop_option);
  return NULL;
}
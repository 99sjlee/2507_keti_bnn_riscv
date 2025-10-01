#include <stddef.h>
#include "ervp_misc_util.h" // due to NULL_FTN_POINTER
#include "ervp_matrix_op.h"
#include "ervp_matrix_op_sw.h"
#include "ervp_matrix_op_transform.h"
#include "ervp_special_matrix_op.h"
#include "ervp_misc_util.h"
#include "ervp_math.h"
#include "core_dependent.h"

int _melement_perform_rshift_and_clip(int value, int rshift, int performs_cliping, int datatype)
{
  int result = math_div_by_shift(value,rshift);
  if(performs_cliping)
  {
    int lower_bound = matrix_datatype_get_lower_bound(datatype);
    int upper_bound = matrix_datatype_get_upper_bound(datatype);
    if(result < lower_bound)
      result = lower_bound;
    if(result > upper_bound)
      result = upper_bound;
  }
  return result;
}

ErvpMatrixInfo* matrix_conv_alloc_output(const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, int conv_options)
{
  ErvpMatrixInfo *result;
  int o_num_row = matrix_conv_output_rows(input_info->num_row, kernel_info->num_row, conv_options);
  int o_num_col = matrix_conv_output_cols(input_info->num_col, kernel_info->num_col, conv_options);
  result = matrix_alloc(input_info->datatype, o_num_row, o_num_col, NULL);
  return result;
}

ErvpMatrixInfo* matrix_pad_alloc_output(const ErvpMatrixInfo *input_info, ervp_mpad_option_t *option_ptr)
{
  ErvpMatrixInfo *result;
  int o_num_row = matrix_pad_output_rows(input_info->num_row, option_ptr);
  int o_num_col = matrix_pad_output_cols(input_info->num_col, option_ptr);
  result = matrix_alloc(input_info->datatype, o_num_row, o_num_col, NULL);
  return result;
}

ervp_mop_mapping_t* matrix_op_mapping_alloc()
{
  ervp_mop_mapping_t* mapping = malloc(sizeof(ervp_mop_mapping_t));
  assert(mapping);
  
  mapping->matrix_copy_part = _matrix_copy_part_sw;
  mapping->matrix_transpose_part = _matrix_transpose_part_sw;
  mapping->matrix_reshape = _matrix_reshape_sw;  

  mapping->matrix_add = _matrix_add_sw;
  mapping->matrix_sub = _matrix_sub_sw;
  mapping->matrix_ewmult = _matrix_ewmult_sw;
  mapping->matrix_mult = _matrix_mult_sw;
  mapping->matrix_conv = _matrix_conv_sw;
  mapping->matrix_conv_sharedinput = matrix_conv_sharedinput_tf;
  mapping->matrix_conv_sharedoutput = matrix_conv_sharedoutput_tf;

  mapping->matrix_scalar_mult_fixed = _matrix_scalar_mult_fixed_sw;
  mapping->matrix_scalar_mult_float = _matrix_scalar_mult_float_sw;
  mapping->matrix_shift_fixed = _matrix_shift_fixed_sw;
  mapping->matrix_perform_postprocess = matrix_perform_postprocess_tf;
  mapping->matrix_pad = _matrix_pad_sw;

  mapping->matrix_fill_fixed = _matrix_fill_fixed_sw;
  mapping->matrix_fill_float = _matrix_fill_float_sw;
  mapping->matrix_identity = _matrix_identity_sw;

  mapping->matrix_copy = matrix_copy2copy_part_tf;
  mapping->matrix_transpose = matrix_transpose2transpose_part_tf;
  mapping->matrix_zero = matrix_zero2fill_tf;
  mapping->matrix_one = matrix_one2fill_tf;

  return mapping;
}
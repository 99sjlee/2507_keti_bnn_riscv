#include <string.h>
#include "ervp_matrix_op.h"

static inline void _matrix_conv_float_each_sw(const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int o_row_index, int o_col_index, ervp_mconv_option_t conv_option)
{
  float result = 0;
  int k_row_index, k_col_index;
  int i_row_index, i_col_index;
  float i_value;
  float k_value;

  for(k_row_index = 0; k_row_index < kernel_info->num_row; k_row_index++)
  {
    for(k_col_index = 0; k_col_index < kernel_info->num_col; k_col_index++)
    {
      i_row_index = k_row_index + o_row_index;
      i_col_index = k_col_index + o_col_index;

      i_value = matrix_read_float_element(input_info, i_row_index, i_col_index);
      k_value = matrix_read_float_element(kernel_info, k_row_index, k_col_index);

      result += i_value * k_value;
    }
  }
  result = _melement_perform_rshift_and_clip(result,conv_option.br.rshift,conv_option.br.performs_cliping,output_info->datatype);
  if(conv_option.br.acc)
    result += matrix_read_float_element(output_info, o_row_index, o_col_index);
  matrix_write_float_element(output_info, o_row_index, o_col_index, result);
}

void _matrix_conv_float_sw(ervp_mop_mapping_t* mop_mapping, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int conv_options)
{
  ervp_mconv_option_t conv_option;
  int o_row_index, o_col_index;
  conv_option.value = conv_options;
  for(o_row_index = 0; o_row_index < output_info->num_row; o_row_index++)
  {
    for(o_col_index = 0; o_col_index < output_info->num_col; o_col_index++)
    {
      _matrix_conv_float_each_sw(input_info, kernel_info, output_info, o_row_index, o_col_index, conv_option);
    }
  }
  output_info->is_binary = 0;
}


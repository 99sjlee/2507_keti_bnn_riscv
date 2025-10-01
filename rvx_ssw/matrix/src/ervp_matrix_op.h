#ifndef __ERVP_MATRIX_OP_H__
#define __ERVP_MATRIX_OP_H__

#include "ervp_printf.h"
#include "ervp_malloc.h"
#include "ervp_matrix.h"
#include "ervp_matrix_element.h"
#include "ervp_task.h"

typedef union
{
  unsigned int value;
  struct
  {
    unsigned int rshift : 8;
    unsigned int performs_cliping : 1;
    unsigned int acc : 1;
  } br;
} ervp_mop_option_t;

typedef union
{
  unsigned int value;
  struct
  {
    unsigned int rshift : 8;
    unsigned int stride_m1 : 8;
    unsigned int pad : 5;
    unsigned int acc : 1;
    unsigned int performs_cliping : 1;
    unsigned int boundary_to_mult : 1;
    unsigned int pretty_to_mult : 8; // number of col in left matrix
  } br;
} ervp_mconv_option_t;

typedef union
{
  uint64_t value;
  struct
  {
    unsigned int row_up_pad : 8;
    unsigned int row_down_pad : 8;
    unsigned int col_up_pad : 8;
    unsigned int col_down_pad : 8;
    unsigned int type;
  } br;
} ervp_mpad_option_t;

typedef struct _ervp_mop_mapping ervp_mop_mapping_t;

typedef struct _ervp_mop_mapping
{
  ervp_task_wait_fx_t (*matrix_copy_part)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options);
  ervp_task_wait_fx_t (*matrix_transpose_part)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options);
  ervp_task_wait_fx_t (*matrix_reshape)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options);

  ervp_task_wait_fx_t (*matrix_add)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
  ervp_task_wait_fx_t (*matrix_sub)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
  ervp_task_wait_fx_t (*matrix_ewmult)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
  ervp_task_wait_fx_t (*matrix_mult)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
  ervp_task_wait_fx_t (*matrix_conv)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int conv_options);
  ervp_task_wait_fx_t (*matrix_conv_sharedinput)(ervp_mop_mapping_t *mop_mapping, int num_output, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo **output_info_list, int conv_options);
  ervp_task_wait_fx_t (*matrix_conv_sharedoutput)(ervp_mop_mapping_t *mop_mapping, int num_input, const ErvpMatrixInfo **input_info_list, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo *output_info, int conv_options, int init_output);

  ervp_task_wait_fx_t (*matrix_scalar_mult_fixed)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, int scalar_value, ErvpMatrixInfo *c, int options);
  ervp_task_wait_fx_t (*matrix_scalar_mult_float)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, float scalar_value, ErvpMatrixInfo *c, int options);
  ervp_task_wait_fx_t (*matrix_shift_fixed)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, int shamount, ErvpMatrixInfo *c, int options);
  ervp_task_wait_fx_t (*matrix_perform_postprocess)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options);
  ervp_task_wait_fx_t (*matrix_pad)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, ervp_mpad_option_t *option_ptr);

  ervp_task_wait_fx_t (*matrix_fill_fixed)(ervp_mop_mapping_t *mop_mapping, ErvpMatrixInfo *result, int32_t value);
  ervp_task_wait_fx_t (*matrix_fill_float)(ervp_mop_mapping_t *mop_mapping, ErvpMatrixInfo *result, float value);
  ervp_task_wait_fx_t (*matrix_identity)(ervp_mop_mapping_t *mop_mapping, ErvpMatrixInfo *result);

  ervp_task_wait_fx_t (*matrix_copy)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options);
  ervp_task_wait_fx_t (*matrix_transpose)(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options);
  ervp_task_wait_fx_t (*matrix_zero)(ervp_mop_mapping_t *mop_mapping, ErvpMatrixInfo *result);
  ervp_task_wait_fx_t (*matrix_one)(ervp_mop_mapping_t *mop_mapping, ErvpMatrixInfo *result);

} ervp_mop_mapping_t;

int _melement_perform_rshift_and_clip(int value, int rshift, int performs_cliping, int datatype);

static inline ervp_mop_option_t mop_option_alloc(unsigned int value)
{
  ervp_mop_option_t mop_option;
  mop_option.value = value;
  return mop_option;
}
static inline void mop_option_free(ervp_mop_option_t option) {}
static inline int _mop_option_check(const ErvpMatrixInfo *minfo, int options)
{
  int option_is_okay = 1;
  ervp_mop_option_t mop_option = mop_option_alloc(options);
  if (matrix_datatype_is_float(minfo->datatype))
  {
    if (mop_option.br.rshift != 0)
      option_is_okay = 0;
    else if (mop_option.br.performs_cliping != 0)
      option_is_okay = 0;
  }
  mop_option_free(mop_option);
  return option_is_okay;
}

static inline int mop_option_has_postprocess(unsigned int value)
{
  ervp_mop_option_t mop_option;
  mop_option.value = value;
  return (mop_option.br.performs_cliping | mop_option.br.rshift) != 0;
}

static inline int mop_option_is_acc(unsigned int value)
{
  ervp_mop_option_t mop_option;
  mop_option.value = value;
  return mop_option.br.acc;
}

static inline unsigned int mop_option_acc_only()
{
  ervp_mop_option_t mop_option;
  mop_option.value = 0;
  mop_option.br.acc = 1;
  return mop_option.value;
}

static inline int matrix_conv_output_rows(int input_row, int kernel_row, int conv_options)
{
  return input_row - kernel_row + 1;
}

static inline int matrix_conv_output_cols(int input_col, int kernel_col, int conv_options)
{
  return input_col - kernel_col + 1;
}

ErvpMatrixInfo *matrix_conv_alloc_output(const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, int conv_options);

static inline int matrix_pad_output_rows(int input_row, ervp_mpad_option_t *option_ptr)
{
  assert_pointer(1, option_ptr);
  return input_row + option_ptr->br.row_up_pad + option_ptr->br.row_down_pad;
}

static inline int matrix_pad_output_cols(int input_col, ervp_mpad_option_t *option_ptr)
{
  assert_pointer(1, option_ptr);
  return input_col + option_ptr->br.col_up_pad + option_ptr->br.col_down_pad;
}

ErvpMatrixInfo *matrix_pad_alloc_output(const ErvpMatrixInfo *input_info, ervp_mpad_option_t *option_ptr);

ervp_mop_mapping_t *matrix_op_mapping_alloc();
static inline void matrix_op_mapping_free(ervp_mop_mapping_t *mapping)
{
  free(mapping);
}

#endif

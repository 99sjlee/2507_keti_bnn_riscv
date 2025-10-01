#ifndef __ERVP_MATRIX_OP_SW_H__
#define __ERVP_MATRIX_OP_SW_H__

#include "ervp_matrix.h"
#include "ervp_matrix_op.h"
#include "ervp_assert.h"

// cal by sw
static inline void _matrix_check_copy_part(const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options)
{
  assert(num_row <= a->num_row);
  assert(num_row <= c->num_row);
  assert(num_col <= a->num_col);
  assert(num_col <= c->num_col);
}

static inline void _matrix_check_transpose_part(const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options)
{
  assert(num_row <= a->num_row);
  assert(num_row <= c->num_col);
  assert(num_col <= a->num_col);
  assert(num_col <= c->num_row);
}

ervp_task_wait_fx_t _matrix_copy_part_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options);
ervp_task_wait_fx_t _matrix_transpose_part_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options);
ervp_task_wait_fx_t _matrix_reshape_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options);

ervp_task_wait_fx_t _matrix_add_float_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
ervp_task_wait_fx_t _matrix_add_fixed_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
ervp_task_wait_fx_t _matrix_add_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);

ervp_task_wait_fx_t _matrix_sub_float_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
ervp_task_wait_fx_t _matrix_sub_fixed_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
ervp_task_wait_fx_t _matrix_sub_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);

ervp_task_wait_fx_t _matrix_ewmult_float_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
ervp_task_wait_fx_t _matrix_ewmult_fixed_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
ervp_task_wait_fx_t _matrix_ewmult_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);

ervp_task_wait_fx_t _matrix_mult_float_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
ervp_task_wait_fx_t _matrix_mult_fixed_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);
ervp_task_wait_fx_t _matrix_mult_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options);

ervp_task_wait_fx_t _matrix_conv_float_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int conv_options);
ervp_task_wait_fx_t _matrix_conv_fixed_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int conv_options);
ervp_task_wait_fx_t _matrix_conv_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int conv_options);

ervp_task_wait_fx_t _matrix_scalar_mult_fixed_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, int scalar_value, ErvpMatrixInfo *c, int options);
ervp_task_wait_fx_t _matrix_scalar_mult_float_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, float scalar_value, ErvpMatrixInfo *c, int options);
ervp_task_wait_fx_t _matrix_shift_fixed_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, int shamount, ErvpMatrixInfo *c, int options);
ervp_task_wait_fx_t _matrix_pad_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, ervp_mpad_option_t* option_ptr);

// redefine

static inline void matrix_copy_part_sw(const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options) { _matrix_copy_part_sw(NULL, a, c, num_row, num_col, options); }
static inline void matrix_transpose_part_sw(const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int num_row, int num_col, int options) { _matrix_transpose_part_sw(NULL, a, c, num_row, num_col, options); }
static inline void matrix_reshape_sw(const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options) { _matrix_reshape_sw(NULL, a, c, options); }

static inline void matrix_add_float_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_add_float_sw(NULL, a, b, c, options); }
static inline void matrix_add_fixed_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_add_fixed_sw(NULL, a, b, c, options); }
static inline void matrix_add_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_add_sw(NULL, a, b, c, options); }

static inline void matrix_sub_float_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_sub_float_sw(NULL, a, b, c, options); }
static inline void matrix_sub_fixed_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_sub_fixed_sw(NULL, a, b, c, options); }
static inline void matrix_sub_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_sub_sw(NULL, a, b, c, options); }

static inline void matrix_ewmult_float_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_ewmult_float_sw(NULL, a, b, c, options); }
static inline void matrix_ewmult_fixed_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_ewmult_fixed_sw(NULL, a, b, c, options); }
static inline void matrix_ewmult_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_ewmult_sw(NULL, a, b, c, options); }

static inline void matrix_mult_float_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_mult_float_sw(NULL, a, b, c, options); }
static inline void matrix_mult_fixed_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_mult_fixed_sw(NULL, a, b, c, options); }
static inline void matrix_mult_sw(const ErvpMatrixInfo *a, const ErvpMatrixInfo *b, ErvpMatrixInfo *c, int options) { _matrix_mult_sw(NULL, a, b, c, options); }

static inline void matrix_conv_float_sw(const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int conv_options) { _matrix_conv_float_sw(NULL, input_info, kernel_info, output_info, conv_options); }
static inline void matrix_conv_fixed_sw(const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int conv_options) { _matrix_conv_fixed_sw(NULL, input_info, kernel_info, output_info, conv_options); }
static inline void matrix_conv_sw(const ErvpMatrixInfo *input_info, const ErvpMatrixInfo *kernel_info, ErvpMatrixInfo *output_info, int conv_options) { _matrix_conv_sw(NULL, input_info, kernel_info, output_info, conv_options); }

static inline void matrix_scalar_mult_fixed_sw(const ErvpMatrixInfo *a, int scalar_value, ErvpMatrixInfo *c, int options) { _matrix_scalar_mult_fixed_sw(NULL, a, scalar_value, c, options); }
static inline void matrix_scalar_mult_float_sw(const ErvpMatrixInfo *a, float scalar_value, ErvpMatrixInfo *c, int options) { _matrix_scalar_mult_float_sw(NULL, a, scalar_value, c, options); }
static inline void matrix_shift_fixed_sw(const ErvpMatrixInfo *a, int shamount, ErvpMatrixInfo *c, int options) { _matrix_shift_fixed_sw(NULL, a, shamount, c, options); }
static inline void matrix_pad_sw(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, ervp_mpad_option_t* option_ptr) { _matrix_pad_sw(NULL, a, c, option_ptr); }

static inline void matrix_copy_sw(const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options)
{
  assert(matrix_compare_size(a, c));
  matrix_copy_part_sw(a, c, a->num_row, a->num_col, options);
}

static inline void matrix_transpose_sw(const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int options)
{
  assert(a->num_row == c->num_col);
  assert(a->num_col == c->num_row);
  matrix_transpose_part_sw(a, c, a->num_row, a->num_col, options);
}

#endif

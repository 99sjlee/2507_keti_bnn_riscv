#ifndef __DCA_MATRIX_INFO_H__
#define __DCA_MATRIX_INFO_H__

#include "ervp_matrix.h"

typedef union
{
  uint32_t hex[5];
  struct
  {
    void *addr;
    int stride_ls3;
    unsigned int num_row_m1 : 32;
    unsigned int num_col_m1 : 32;
    unsigned int is_signed : 1;
    unsigned int is_float : 1;
    unsigned int addr_lsa_p3 : 3;
  } br;
} dca_matrix_info_t;

dca_matrix_info_t *dca_generate_matrix_info(const ErvpMatrixInfo *info, dca_matrix_info_t *prealloated);
dca_matrix_info_t *dca_init_matrix_info(dca_matrix_info_t *prealloated);

#endif
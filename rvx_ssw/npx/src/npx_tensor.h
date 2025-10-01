#ifndef __NPX_TENSOR_H__
#define __NPX_TENSOR_H__

#include <stdint.h>
#include "platform_info.h"
#include "ervp_matrix.h"

typedef struct
{
	void *addr;
	int *size;	 // 0:w, 1:h, 2:c
	int *stride; // stride[0] is data size of value.
	int num_dim;
	int datatype;
	int is_binary;
	int is_allocated;
} NpxTensorInfo;

NpxTensorInfo *npx_tensor_alloc_wo_data(int num_dim);
void npx_tensor_alloc_data(NpxTensorInfo *a);
void npx_tensor_free(NpxTensorInfo *a);
int npx_tensor_elements(const NpxTensorInfo *a);
int npx_tensor_set_datatype(NpxTensorInfo *a, int datatype);
static inline size_t npx_tensor_get_datasize(const NpxTensorInfo *a)
{
	return a->stride[0];
}

static inline int npx_tensor_sizes(const NpxTensorInfo *a)
{
	return npx_tensor_get_datasize(a) * npx_tensor_elements(a);
}

ErvpMatrixInfo *npx_tensor_to_matrix_info(const NpxTensorInfo *tensor, ErvpMatrixInfo *preallocated);
ErvpMatrixInfo *npx_tensor_to_iterative_matrix_info(const NpxTensorInfo *tensor, int num_channel, ErvpMatrixInfo *preallocated);
ErvpMatrixInfo **npx_tensor_to_matrix_info_list(const NpxTensorInfo *tensor, int num_channel, int num_info, ErvpMatrixInfo **preallocated);
void npx_tensor_print(const NpxTensorInfo *tensor, int num_elements);

void npx_tensor_reshape(const NpxTensorInfo *a, NpxTensorInfo *b);
NpxTensorInfo *npx_tensor_permute(const NpxTensorInfo *a, NpxTensorInfo *b, int *dims);
NpxTensorInfo *npx_tensor_resize(const NpxTensorInfo *a, NpxTensorInfo *b, int h, int w);

NpxTensorInfo *npx_tensor_cast_sint8_to_float(const NpxTensorInfo *tensor);

#endif
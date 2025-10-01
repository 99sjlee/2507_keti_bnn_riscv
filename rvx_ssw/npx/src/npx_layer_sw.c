#include "platform_info.h"
#include "ervp_printf.h"
#include "ervp_malloc.h"
#include "ervp_assert.h"
#include "ervp_math.h"
#include "ervp_matrix_op_sw.h"
#include "ervp_special_matrix_op.h"

#include <string.h>
#include <stdint.h>
#include <limits.h>

#include "npx_tensor.h"
#include "npx_layer.h"
#include "npx_network.h"
#include "npx_profiling.h"

char npx_layer_type_to_char(npx_layer_type_t type)
{
  char result = 0;
  switch (type)
  {
  case NPXL_CONV2D:
    result = 'c';
    break;
  case NPXL_LINEAR:
    result = 'f';
    break;
  case NPXL_MAXPOOL2D:
    result = 'm';
    break;
  case NPXL_AVGPOOL2D:
    result = 'a';
    break;
  case NPXL_LEAKY:
    result = 'n';
    break;
  case NPXL_FLATTEN:
    result = '-';
    break;
  case NPXL_BLOCK:
    result = 'b';
    break;
  default:
    assert(0);
  }
  return result;
}

const char *npx_layer_type_to_str(npx_layer_type_t type)
{
  const char *result = NULL;
  switch (type)
  {
  case NPXL_CONV2D:
    result = "NPXL_CONV2D";
    break;
  case NPXL_LINEAR:
    result = "NPXL_LINEAR";
    break;
  case NPXL_MAXPOOL2D:
    result = "NPXL_MAXPOOL2D";
    break;
  case NPXL_AVGPOOL2D:
    result = "NPXL_AVGPOOL2D";
    break;
  case NPXL_LEAKY:
    result = "NPXL_LEAKY";
    break;
  case NPXL_FLATTEN:
    result = "NPXL_FLATTEN";
    break;
  case NPXL_BLOCK:
    result = "NPXL_BLOCK";
    break;
  default:
    assert(0);
  }
  return result;
}

int npx_layer_output_size(npx_layer_type_t layer_type, void *layer)
{
  assert(layer);
  int outputs = 0;
  if (layer_type == NPXL_BLOCK)
  {
    npx_layer_block_t *p = (npx_layer_block_t *)layer;
    assert(p->layer_compute_seq);
    npx_layer_compute_t *layer_compute = p->layer_compute_seq[p->num_layer - 1];
    assert(layer_compute);
    assert(layer_compute->layer_type != NPXL_BLOCK);
    outputs = npx_layer_output_size(layer_compute->layer_type, layer_compute->layer);
  }
  else
  {
    npx_layer2d_iodata_t *p = &(((npx_conv2d_layer_t *)layer)->iodata);
    outputs = p->out_size[0] * p->out_size[1] * p->out_channels;
  }
  return outputs;
}

int npx_layer_testvector_size(npx_layer_type_t layer_type, void *layer)
{
  assert(layer);
  int outputs = 0;
  if (layer_type == NPXL_BLOCK)
  {
    npx_layer_block_t *p = (npx_layer_block_t *)layer;
    assert(p->layer_compute_seq);
    for (int i = 0; i < p->num_layer; i++)
    {
      npx_layer_compute_t *layer_compute = p->layer_compute_seq[i];
      assert(layer_compute);
      assert(layer_compute->layer_type != NPXL_BLOCK);
      outputs += npx_layer_output_size(layer_compute->layer_type, layer_compute->layer);
    }
  }
  else
    outputs = npx_layer_output_size(layer_type, layer);
  return outputs;
}

npx_layerio_tsseq_t *npx_layerio_tsseq_alloc(int timesteps)
{
  npx_layerio_tsseq_t *result = malloc(sizeof(npx_layerio_tsseq_t));
  result->timesteps = timesteps;
  result->sequence = (NpxTensorInfo **)malloc(sizeof(NpxTensorInfo *) * timesteps);
  for (int i = 0; i < timesteps; i++)
    result->sequence[i] = NULL;
  result->is_boundary = NULL;
  result->scaled = 0;
  return result;
}

npx_layerio_tsseq_t *npx_output_tsseq_alloc(int timesteps, const int *is_boundary, float scaled, int datatype, int num_dim, int *size_array)
{
  npx_layerio_tsseq_t *output_tsseq = npx_layerio_tsseq_alloc(timesteps);
  output_tsseq->scaled = scaled;
  output_tsseq->is_boundary = is_boundary;
  for (int i = 0; i < timesteps; i++)
  {
    NpxTensorInfo *output_tensor = npx_tensor_alloc_wo_data(num_dim);
    assert(output_tensor);
    output_tsseq->sequence[i] = output_tensor;
    for (int j = 0; j < num_dim; j++)
      output_tensor->size[j] = size_array[j];
    npx_tensor_set_datatype(output_tensor, datatype);
    npx_tensor_alloc_data(output_tensor);
  }
  return output_tsseq;
}

void npx_forward_flatten_layer_sw(npx_flatten_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  NPX_PROFILING_START();
  printf_function();
  assert_pointer(2, layer, state);
  const int timesteps = state->input_tsseq->timesteps;
  assert(state->output_tsseq == NULL);
  const NpxTensorInfo *const input_tensor = state->input_tsseq->sequence[0];
  int size[2];
  size[0] = 1;
  size[1] = npx_tensor_elements(input_tensor);
  state->output_tsseq = npx_output_tsseq_alloc(timesteps, state->input_tsseq->is_boundary, state->input_tsseq->scaled, input_tensor->datatype, 2, size);

  for (int i = 0; i < timesteps; i++)
  {
    NpxTensorInfo *input_tensor = state->input_tsseq->sequence[i];
    NpxTensorInfo *output_tensor = state->output_tsseq->sequence[i];
    assert(input_tensor);
    assert(output_tensor);
    npx_tensor_reshape(input_tensor, output_tensor);
  }
  NPX_PROFILING_END();
}

static void _matrix_maxpool_fixed_each(npx_maxpool2d_layer_t *layer, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int row_index, int col_index)
{
  int max_value = INT32_MIN;
  for (int i = 0; i < layer->kernel_size; i++)
  {
    int input_row_index = (row_index * layer->stride) + i;
    for (int j = 0; j < layer->kernel_size; j++)
    {
      int input_col_index = (col_index * layer->stride) + j;
      int value = matrix_read_fixed_element(a, input_row_index, input_col_index);
      if (value > max_value)
        max_value = value;
    }
  }
  matrix_write_fixed_element(c, row_index, col_index, max_value);
}

static void _matrix_maxpool(npx_maxpool2d_layer_t *layer, const ErvpMatrixInfo *a, ErvpMatrixInfo *c)
{
  assert(layer->padding == 0);
  if (matrix_datatype_is_float(a->datatype))
  {
    assert(0);
  }
  else
    for (int i = 0; i < c->num_row; i++)
      for (int j = 0; j < c->num_col; j++)
        _matrix_maxpool_fixed_each(layer, a, c, i, j);
}

void npx_forward_maxpool2d_layer_sw(npx_maxpool2d_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  NPX_PROFILING_START();
  printf_function();
  assert_pointer(2, layer, state);
  const int timesteps = state->input_tsseq->timesteps;
  assert(state->output_tsseq == NULL);
  const NpxTensorInfo *const input_tensor = state->input_tsseq->sequence[0];
  assert(layer->iodata.in_size[0] == input_tensor->size[0]);
  assert(layer->iodata.in_size[1] == input_tensor->size[1]);
  assert(layer->iodata.out_size[0] == (((input_tensor->size[0] + 2 * layer->padding - layer->kernel_size) / layer->stride) + 1));
  assert(layer->iodata.out_size[1] == (((input_tensor->size[1] + 2 * layer->padding - layer->kernel_size) / layer->stride) + 1));

  int size[3];
  size[0] = layer->iodata.out_size[0];
  size[1] = layer->iodata.out_size[1];
  size[2] = input_tensor->size[2];
  state->output_tsseq = npx_output_tsseq_alloc(timesteps, state->input_tsseq->is_boundary, state->input_tsseq->scaled, input_tensor->datatype, 3, size);

  for (int i = 0; i < timesteps; i++)
  {
    NpxTensorInfo *input_tensor3d = state->input_tsseq->sequence[i];
    NpxTensorInfo *output_tensor3d = state->output_tsseq->sequence[i];
    assert(input_tensor3d);
    assert(output_tensor3d);
    ErvpMatrixInfo *input_matrix = NULL;
    ErvpMatrixInfo *output_matrix = NULL;

    for (int j = 0; j < layer->iodata.out_channels; j++)
    {
      input_matrix = npx_tensor_to_iterative_matrix_info(input_tensor3d, 1, input_matrix);
      output_matrix = npx_tensor_to_iterative_matrix_info(output_tensor3d, 1, output_matrix);
      _matrix_maxpool(layer, input_matrix, output_matrix);
    }
    matrix_free(input_matrix);
    matrix_free(output_matrix);
  }
  NPX_PROFILING_END();
}

static void _matrix_advpool_fixed_each(npx_maxpool2d_layer_t *layer, const ErvpMatrixInfo *a, ErvpMatrixInfo *c, int row_index, int col_index)
{
  int sum = 0;
  for (int i = 0; i < layer->kernel_size; i++)
  {
    int input_row_index = (row_index * layer->stride) + i;
    for (int j = 0; j < layer->kernel_size; j++)
    {
      int input_col_index = (col_index * layer->stride) + j;
      int value = matrix_read_fixed_element(a, input_row_index, input_col_index);
      sum += value;
    }
  }
  // sum /= (layer->kernel_size * layer->kernel_size);
  matrix_write_fixed_element(c, row_index, col_index, sum);
}

static void _matrix_advpool(npx_maxpool2d_layer_t *layer, const ErvpMatrixInfo *a, ErvpMatrixInfo *c)
{
  assert(layer->padding == 0);
  if (matrix_datatype_is_float(a->datatype))
  {
    assert(0);
  }
  else
    for (int i = 0; i < c->num_row; i++)
      for (int j = 0; j < c->num_col; j++)
        _matrix_advpool_fixed_each(layer, a, c, i, j);
}

void npx_forward_avgpool2d_layer_sw(npx_avgpool2d_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  NPX_PROFILING_START();
  printf_function();
  assert_pointer(2, layer, state);
  const int timesteps = state->input_tsseq->timesteps;
  assert(state->output_tsseq == NULL);
  const NpxTensorInfo *const input_tensor = state->input_tsseq->sequence[0];
  int size[3];
  size[0] = ((input_tensor->size[0] + 2 * layer->padding - layer->kernel_size) / layer->stride) + 1;
  size[1] = ((input_tensor->size[1] + 2 * layer->padding - layer->kernel_size) / layer->stride) + 1;
  size[2] = input_tensor->size[2];
  state->output_tsseq = npx_output_tsseq_alloc(timesteps, state->input_tsseq->is_boundary, state->input_tsseq->scaled, input_tensor->datatype, 3, size);
  state->output_tsseq->scaled *= (layer->kernel_size * layer->kernel_size);

  for (int i = 0; i < timesteps; i++)
  {
    NpxTensorInfo *input_tensor3d = state->input_tsseq->sequence[i];
    NpxTensorInfo *output_tensor3d = state->output_tsseq->sequence[i];
    assert(input_tensor3d);
    assert(output_tensor3d);
    ErvpMatrixInfo *input_matrix = NULL;
    ErvpMatrixInfo *output_matrix = NULL;

    for (int j = 0; j < layer->iodata.out_channels; j++)
    {
      input_matrix = npx_tensor_to_iterative_matrix_info(input_tensor3d, 1, input_matrix);
      output_matrix = npx_tensor_to_iterative_matrix_info(output_tensor3d, 1, output_matrix);
      _matrix_advpool(layer, input_matrix, output_matrix);
    }
    matrix_free(input_matrix);
    matrix_free(output_matrix);
  }
  NPX_PROFILING_END();
}

void npx_forward_conv2d_layer_sw(npx_conv2d_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  NPX_PROFILING_START();
  printf_function();
  assert_pointer(2, layer, state);
  const int timesteps = state->input_tsseq->timesteps;
  assert(state->output_tsseq == NULL);
  const NpxTensorInfo *const input_tensor = state->input_tsseq->sequence[0];
  assert(layer->iodata.in_size[0] == input_tensor->size[0]);
  assert(layer->iodata.in_size[1] == input_tensor->size[1]);
  assert(layer->iodata.out_size[0] == (((input_tensor->size[0] + 2 * layer->padding - layer->kernel_size) / layer->stride) + 1));
  assert(layer->iodata.out_size[1] == (((input_tensor->size[1] + 2 * layer->padding - layer->kernel_size) / layer->stride) + 1));

  int size[3];
  size[0] = layer->iodata.out_size[0];
  size[1] = layer->iodata.out_size[1];
  size[2] = layer->iodata.out_channels;
  int datatype = layer->iodata.out_is_quantized ? MATRIX_DATATYPE_SINT32 : MATRIX_DATATYPE_FLOAT32;
  state->output_tsseq = npx_output_tsseq_alloc(timesteps, state->input_tsseq->is_boundary, state->input_tsseq->scaled, datatype, 3, size);

  ervp_mconv_option_t conv_option;
  conv_option.value = 0;
  conv_option.br.acc = 1;

  for (int i = 0; i < timesteps; i++)
  {
    NpxTensorInfo *input_tensor3d = state->input_tsseq->sequence[i];
    NpxTensorInfo *output_tensor3d = state->output_tsseq->sequence[i];
    assert(input_tensor3d);
    assert(output_tensor3d);
    ErvpMatrixInfo *weight_matrix = NULL;
    ErvpMatrixInfo *output_matrix = NULL;

    for (int j = 0; j < layer->iodata.out_channels; j++)
    {
      output_matrix = npx_tensor_to_iterative_matrix_info(output_tensor3d, 1, output_matrix);
      matrix_zero_sw(output_matrix);
      ErvpMatrixInfo *input_matrix = NULL;
      for (int k = 0; k < layer->iodata.in_channels; k++)
      {
        input_matrix = npx_tensor_to_iterative_matrix_info(input_tensor3d, 1, input_matrix);
        weight_matrix = npx_tensor_to_iterative_matrix_info(layer->weight_tensor, 1, weight_matrix);

        matrix_conv_sw(input_matrix, weight_matrix, output_matrix, conv_option.value);
      }
      matrix_free(input_matrix);
    }
    matrix_free(weight_matrix);
    matrix_free(output_matrix);
  }
  NPX_PROFILING_END();
}

void npx_forward_linear_layer_sw(npx_linear_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  NPX_PROFILING_START();
  printf_function();
  assert_pointer(2, layer, state);
  const int timesteps = state->input_tsseq->timesteps;
  assert(state->output_tsseq == NULL);
  const NpxTensorInfo *const input_tensor = state->input_tsseq->sequence[0];
  int size[2];
  size[0] = 1;
  size[1] = layer->out_features;
  int datatype = matrix_datatype_is_float(input_tensor->datatype) ? MATRIX_DATATYPE_FLOAT32 : MATRIX_DATATYPE_SINT32;
  state->output_tsseq = npx_output_tsseq_alloc(timesteps, state->input_tsseq->is_boundary, state->input_tsseq->scaled, datatype, 2, size);

  ErvpMatrixInfo *weight_matrix = npx_tensor_to_matrix_info(layer->weight_tensor, NULL);
  for (int i = 0; i < timesteps; i++)
  {
    NpxTensorInfo *input_tensor3d = state->input_tsseq->sequence[i];
    NpxTensorInfo *output_tensor3d = state->output_tsseq->sequence[i];
    assert(input_tensor3d);
    assert(output_tensor3d);
    ErvpMatrixInfo *input_vector = NULL;
    ErvpMatrixInfo *output_vector = NULL;

    for (int j = 0; j < layer->iodata.out_channels; j++)
    {
      input_vector = npx_tensor_to_iterative_matrix_info(input_tensor3d, 1, input_vector);
      output_vector = npx_tensor_to_iterative_matrix_info(output_tensor3d, 1, output_vector);
      matrix_mult_sw(weight_matrix, input_vector, output_vector, 0);
    }
    matrix_free(input_vector);
    matrix_free(output_vector);
  }
  matrix_free(weight_matrix);
  NPX_PROFILING_END();
}

static void matrix_compare_reset_decay(npx_leaky_layer_t *layer, int mp_scale, ErvpMatrixInfo *mp_matrix, ErvpMatrixInfo *output_matrix)
{
  int threshold_scaled = layer->threshold * mp_scale;
  int does_decay = (layer->beta != 1.0f);
  int is_hard_reset = (strcmp(layer->reset_mechanism, "zero") == 0);
  int is_soft_reset = (strcmp(layer->reset_mechanism, "subtract") == 0);
  assert(is_hard_reset || is_soft_reset);
  int has_reset_delay = (strcmp(layer->reset_delay, "True") == 0);

  // NOT supported
  assert(has_reset_delay);

  if (matrix_datatype_is_float(mp_matrix->datatype))
  {
    assert(0);
  }
  else
  {
    for (int i = 0; i < mp_matrix->num_row; i++)
      for (int j = 0; j < mp_matrix->num_col; j++)
      {
        int diff;
        int mp = matrix_read_fixed_element(mp_matrix, i, j);
        int spike = (mp > threshold_scaled); // NOT >=
        matrix_write_fixed_element(output_matrix, i, j, spike);
        int value = 0;
        if (is_hard_reset)
        {
          if (spike)
            value = 0;
          else if (does_decay) // mp * layer->beta
            value = math_div_by_shift(mp * layer->beta_numerator, layer->beta_denominator_rsa);
        }
        else
        {
          value = mp;
          if (does_decay) // mp * layer->beta
            value = math_div_by_shift(mp * layer->beta_numerator, layer->beta_denominator_rsa);
          if (spike)
            value -= threshold_scaled;
        }
        if (spike || does_decay)
          matrix_write_fixed_element(mp_matrix, i, j, value);
      }
  }
}

void npx_forward_leaky_layer_sw(npx_leaky_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  printf_function();
  assert_pointer(2, layer, state);
  const int timesteps = state->input_tsseq->timesteps;
  assert(state->input_tsseq);
  assert(state->input_tsseq->is_boundary);
  assert(state->output_tsseq == NULL);
  const NpxTensorInfo *const input_tensor = state->input_tsseq->sequence[0];
  state->output_tsseq = npx_output_tsseq_alloc(timesteps, state->input_tsseq->is_boundary, 1, MATRIX_DATATYPE_SINT08, input_tensor->num_dim, input_tensor->size);
  ErvpMatrixInfo *temp_matrix = NULL;
  int input_scalar_factor = 1;

  if (state->input_tsseq->scaled != layer->membrane_potential_scaled)
  {
    assert(state->input_tsseq->scaled >= 1);
    int lcm = math_lcm(state->input_tsseq->scaled, layer->membrane_potential_scaled);
    if (lcm != layer->membrane_potential_scaled)
    {
      int scalar_factor = lcm / layer->membrane_potential_scaled;
      for (int j = 0; j < layer->iodata.out_channels; j++)
        matrix_scalar_mult_fixed_sw(layer->membrane_potential[j], scalar_factor, layer->membrane_potential[j], 0);
      layer->membrane_potential_scaled = lcm;
    }
    if (lcm != state->input_tsseq->scaled)
    {
      input_scalar_factor = lcm / state->input_tsseq->scaled;
      temp_matrix = matrix_alloc(MATRIX_DATATYPE_SINT32, input_tensor->size[1], input_tensor->size[0], NULL);
    }
  }

  for (int i = 0; i < timesteps; i++)
  {
    NpxTensorInfo *input_tensor3d = state->input_tsseq->sequence[i];
    NpxTensorInfo *output_tensor3d = state->output_tsseq->sequence[i];
    output_tensor3d->is_binary = 1;
    assert(input_tensor3d);
    assert(output_tensor3d);
    ErvpMatrixInfo *input_matrix = NULL;
    ErvpMatrixInfo *output_matrix = NULL;

    for (int j = 0; j < layer->iodata.out_channels; j++)
    {
      ErvpMatrixInfo *scaled_input_matrix = NULL;
      input_matrix = npx_tensor_to_iterative_matrix_info(input_tensor3d, 1, input_matrix);
      output_matrix = npx_tensor_to_iterative_matrix_info(output_tensor3d, 1, output_matrix);
      if (input_scalar_factor == 1)
        scaled_input_matrix = input_matrix;
      else
      {
        matrix_scalar_mult_fixed_sw(input_matrix, input_scalar_factor, temp_matrix, 0);
        scaled_input_matrix = temp_matrix;
      }

      if (state->input_tsseq->is_boundary[i])
      {
        matrix_add_sw(scaled_input_matrix, layer->membrane_potential[j], layer->membrane_potential[j], 0);
        matrix_compare_reset_decay(layer, layer->membrane_potential_scaled, layer->membrane_potential[j], output_matrix);
      }
      else
        matrix_add_sw(scaled_input_matrix, layer->membrane_potential[j], layer->membrane_potential[j], 0);
    }
    matrix_free(input_matrix);
    matrix_free(output_matrix);
  }
  if (temp_matrix)
    matrix_free(temp_matrix);
}

void npx_forward_block_layer_sw(npx_layer_block_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  state->output_tsseq = npx_foward_layers(layer->layer_compute_seq, state->input_tsseq, 0, layer->num_layer);
}
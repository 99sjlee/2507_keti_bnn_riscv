#include "platform_info.h"
#include "ervp_printf.h"
#include "ervp_malloc.h"
#include "ervp_assert.h"
#include "ervp_round_int.h"
#include "ervp_math.h"
#include "ervp_matrix_op_sw.h"
#include "ervp_matrix_op_transform.h"
#include "ervp_special_matrix_op.h"
#include "npx_profiling.h"

#include <string.h>
#include <stdint.h>
#include <limits.h>

#include "npx_tensor.h"
#include "npx_layer.h"

static void npx_forward_conv2d_layer_matrix_old(npx_conv2d_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  if (mop_mapping == NULL)
    npx_forward_conv2d_layer_sw(layer, NULL, state);
  else
  {
    printf_function();
    assert(mop_mapping);
    assert(((int)layer) | ((int)state));
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

    ervp_task_wait_fx_t task_wait_fx = NULL;
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
        task_wait_finish(task_wait_fx);
        mop_mapping->matrix_zero(mop_mapping, output_matrix);
        ErvpMatrixInfo *input_matrix = NULL;
        for (int k = 0; k < layer->iodata.in_channels; k++)
        {
          input_matrix = npx_tensor_to_iterative_matrix_info(input_tensor3d, 1, input_matrix);
          weight_matrix = npx_tensor_to_iterative_matrix_info(layer->weight_tensor, 1, weight_matrix);

          task_wait_finish(task_wait_fx);
          task_wait_fx = mop_mapping->matrix_conv(mop_mapping, input_matrix, weight_matrix, output_matrix, conv_option.value);
        }
        matrix_free(input_matrix);
      }
      matrix_free(weight_matrix);
      matrix_free(output_matrix);
    }
    task_wait_finish(task_wait_fx);
  }
}

static void _forward_conv2d_layer_matrix_sharedoutput(npx_conv2d_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  printf_function();
  assert(mop_mapping->matrix_conv_sharedoutput);
  assert(layer->padding == 0);
  assert(layer->stride == 1);
  const int timesteps = state->input_tsseq->timesteps;
  int size[3];
  size[0] = layer->iodata.out_size[0];
  size[1] = layer->iodata.out_size[1];
  size[2] = layer->iodata.out_channels;
  int datatype = layer->iodata.out_is_quantized ? MATRIX_DATATYPE_SINT32 : MATRIX_DATATYPE_FLOAT32;
  state->output_tsseq = npx_output_tsseq_alloc(timesteps, state->input_tsseq->is_boundary, state->input_tsseq->scaled, datatype, 3, size);

  ErvpMatrixInfo **input_matrix_info_list = NULL;

  ervp_task_wait_fx_t task_wait_fx = NULL;
  ervp_mconv_option_t conv_option;
  conv_option.value = 0;
  conv_option.br.acc = 1;

  for (int i = 0; i < timesteps; i++)
  {
    NpxTensorInfo *input_tensor3d = state->input_tsseq->sequence[i];
    NpxTensorInfo *output_tensor3d = state->output_tsseq->sequence[i];
    assert(input_tensor3d);
    assert(output_tensor3d);
    input_matrix_info_list = npx_tensor_to_matrix_info_list(input_tensor3d, 1, layer->iodata.in_channels, input_matrix_info_list);

    ErvpMatrixInfo *output_matrix = NULL;
    for (int j = 0; j < layer->iodata.out_channels; j++)
    {
      output_matrix = npx_tensor_to_iterative_matrix_info(output_tensor3d, 1, output_matrix);
      task_wait_fx = mop_mapping->matrix_conv_sharedoutput(mop_mapping, layer->iodata.in_channels, input_matrix_info_list, &(layer->weight_matrix_info_list_for_output_reuse[j * layer->iodata.in_channels]), output_matrix, conv_option.value, 1);
    }
    if (output_matrix)
      matrix_free(output_matrix);
  }
  if (input_matrix_info_list)
    matrix_list_free(input_matrix_info_list, layer->iodata.in_channels);
  task_wait_finish(task_wait_fx);
}

static void _forward_conv2d_layer_matrix_sharedinput(npx_conv2d_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  printf_function();
  assert(mop_mapping->matrix_conv_sharedinput);
  const int timesteps = state->input_tsseq->timesteps;
  int size[3];
  size[0] = layer->iodata.out_size[0];
  size[1] = layer->iodata.out_size[1];
  size[2] = layer->iodata.out_channels;
  int datatype = layer->iodata.out_is_quantized ? MATRIX_DATATYPE_SINT32 : MATRIX_DATATYPE_FLOAT32;
  state->output_tsseq = npx_output_tsseq_alloc(timesteps, state->input_tsseq->is_boundary, state->input_tsseq->scaled, datatype, 3, size);

  ErvpMatrixInfo **output_matrix_info_list = NULL;

  ervp_task_wait_fx_t task_wait_fx = NULL;
  ervp_mconv_option_t conv_option;
  conv_option.value = 0;
  conv_option.br.acc = 1;
  conv_option.br.pad = layer->padding;
  conv_option.br.stride_m1 = layer->stride - 1;

  for (int i = 0; i < timesteps; i++)
  {
    NpxTensorInfo *input_tensor3d = state->input_tsseq->sequence[i];
    NpxTensorInfo *output_tensor3d = state->output_tsseq->sequence[i];
    assert(input_tensor3d);
    assert(output_tensor3d);
    output_matrix_info_list = npx_tensor_to_matrix_info_list(output_tensor3d, 1, layer->iodata.out_channels, output_matrix_info_list);

    for (int j = 0; j < layer->iodata.out_channels; j++)
      task_wait_fx = mop_mapping->matrix_zero(mop_mapping, output_matrix_info_list[j]);

    ErvpMatrixInfo *input_matrix = NULL;
    for (int k = 0; k < layer->iodata.in_channels; k++)
    {
      input_matrix = npx_tensor_to_iterative_matrix_info(input_tensor3d, 1, input_matrix);
      task_wait_finish(task_wait_fx);
      task_wait_fx = mop_mapping->matrix_conv_sharedinput(mop_mapping, layer->iodata.out_channels, input_matrix, &(layer->weight_matrix_info_list_for_input_reuse[k * layer->iodata.out_channels]), output_matrix_info_list, conv_option.value);
    }
    if (input_matrix)
      matrix_free(input_matrix);
  }
  if (output_matrix_info_list)
    matrix_list_free(output_matrix_info_list, layer->iodata.out_channels);
  task_wait_finish(task_wait_fx);
}

static void _check_conv2d_layer(npx_conv2d_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  assert_pointer(2, layer, state);
  assert(state->output_tsseq == NULL);

  const NpxTensorInfo *const input_tensor = state->input_tsseq->sequence[0];
  assert(layer->iodata.in_size[0] == input_tensor->size[0]);
  assert(layer->iodata.in_size[1] == input_tensor->size[1]);
  assert(layer->iodata.out_size[0] == (((input_tensor->size[0] + 2 * layer->padding - layer->kernel_size) / layer->stride) + 1));
  assert(layer->iodata.out_size[1] == (((input_tensor->size[1] + 2 * layer->padding - layer->kernel_size) / layer->stride) + 1));
}

void npx_forward_conv2d_layer_matrix(npx_conv2d_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  printf_function();
  _check_conv2d_layer(layer, mop_mapping, state);
  if (mop_mapping == NULL)
    npx_forward_conv2d_layer_sw(layer, NULL, state);
  else
  {
    int use_multi_input = 0;
    if (layer->padding != 0)
      use_multi_input = 0;
    else if (layer->stride != 1)
      use_multi_input = 0;
    else if ((layer->iodata.in_channels == 1) && (layer->iodata.out_channels == 1))
      use_multi_input = 1;
    else if (layer->iodata.out_channels == 1)
      use_multi_input = 1;
    else if (layer->iodata.in_channels == 1)
      use_multi_input = 0;
    else if (mop_mapping->matrix_conv_sharedoutput != matrix_conv_sharedoutput_tf)
      use_multi_input = 1;
    else
      use_multi_input = 0;

    NPX_PROFILING_START();
    if (use_multi_input)
    {
      assert(mop_mapping->matrix_conv_sharedoutput);
      _forward_conv2d_layer_matrix_sharedoutput(layer, mop_mapping, state);
    }
    else
    {
      assert(mop_mapping->matrix_conv_sharedinput);
      _forward_conv2d_layer_matrix_sharedinput(layer, mop_mapping, state);
    }
    NPX_PROFILING_END();
  }
}

void npx_forward_linear_layer_matrix(npx_linear_layer_t *layer, ervp_mop_mapping_t *mop_mapping, npx_layerio_state_t *state)
{
  if (mop_mapping == NULL)
    npx_forward_linear_layer_sw(layer, NULL, state);
  else
  {
    NPX_PROFILING_START();
    printf_function();
    assert(mop_mapping);
    assert(((int)layer) | ((int)state));
    const int timesteps = state->input_tsseq->timesteps;
    assert(state->output_tsseq == NULL);
    const NpxTensorInfo *const input_tensor = state->input_tsseq->sequence[0];
    int size[2];
    size[0] = 1;
    size[1] = layer->out_features;
    int datatype = matrix_datatype_is_float(input_tensor->datatype) ? MATRIX_DATATYPE_FLOAT32 : MATRIX_DATATYPE_SINT32;
    state->output_tsseq = npx_output_tsseq_alloc(timesteps, state->input_tsseq->is_boundary, state->input_tsseq->scaled, datatype, 2, size);

    ErvpMatrixInfo *weight_matrix = npx_tensor_to_matrix_info(layer->weight_tensor, NULL);
    ervp_task_wait_fx_t task_wait_fx = NULL;

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
        task_wait_fx = mop_mapping->matrix_mult(mop_mapping, weight_matrix, input_vector, output_vector, 0);
      }
      matrix_free(input_vector);
      matrix_free(output_vector);
    }
    matrix_free(weight_matrix);
    task_wait_finish(task_wait_fx);
    NPX_PROFILING_END();
  }
}
#include "ervp_mmiox1.h"
#include "ervp_printf.h"
#include "ervp_caching.h"
#include "ervp_delay.h"

#include "dca_matrix_info.h"
#include "dca_matrix_mac.h"

typedef struct
{
	dca_matrix_info_t ma;
	dca_matrix_info_t mb;
	dca_matrix_info_t mc;
	uint32_t opcode;
} dca_matrix_mac_inst_t;

static UNKNOWN_TYPE scalar_matrix_value;
static ErvpMatrixInfo scalar_matrix_info;

static void __attribute__((constructor)) construct_dca_matrix_mac()
{
	matrix_generate_info(MATRIX_DATATYPE_SINT32, 1, 1, &scalar_matrix_value, &scalar_matrix_info);
}

void dca_matrix_mac_hwinfo_elaborate(dca_matrix_mac_hwpara_t *hwpara, dca_matrix_mac_hwinfo_t *hwinfo)
{
	static int id_to_issue = 0;
	hwinfo->num_col = hwpara->matrix_size_para % 10000;
	hwinfo->num_row = (hwpara->matrix_size_para / 10000) % 10000;
	hwinfo->id = id_to_issue++;
}

static void _dca_matrix_mac_request(const dca_matrix_mac_hwinfo_t *const hwinfo, int opcode, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info)
{
	dca_matrix_mac_inst_t inst;

	inst.opcode = opcode;
	dca_generate_matrix_info(ma_info, &(inst.ma));
	dca_generate_matrix_info(mb_info, &(inst.mb));
	dca_generate_matrix_info(mc_info, &(inst.mc));

	mmiox1_inst_push(hwinfo->mmiox_info, &inst, 1, 0);
}

ervp_task_wait_fx_t dca_matrix_mac_start(ervp_mop_mapping_t *mop_mapping, const dca_matrix_mac_hwinfo_t *const hwinfo, int opcode, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, int options)
{
	ervp_task_wait_fx_t task_wait_fx = NULL;
	if (mop_option_has_postprocess(options))
	{
		ErvpMatrixInfo *temp = matrix_alloc(MATRIX_DATATYPE_SINT32, mc_info->num_row, mc_info->num_col, NULL);
		cache_flush_smart(3, ma_info->addr, mb_info->addr, mc_info->addr);
		_dca_matrix_mac_request(hwinfo, opcode, ma_info, mb_info, temp);
		dca_matrix_mac_wait(hwinfo);
		task_wait_fx = mop_mapping->matrix_perform_postprocess(mop_mapping, temp, mc_info, options);
		task_wait_finish(task_wait_fx);
		matrix_free(temp);
	}
	else
	{
		int opcode_with_acc = opcode;
		if (mop_option_is_acc(options))
		{
			opcode_with_acc &= (~DCA_MATRIX_MAC_OPCODE_INIT_ACC);
			opcode_with_acc |= DCA_MATRIX_MAC_OPCODE_LOAD_ACC;
		}
		cache_flush_smart(-1);
		_dca_matrix_mac_request(hwinfo, opcode_with_acc, ma_info, mb_info, mc_info);
		task_wait_fx = dca_matrix_mac_wait_fx(hwinfo);
	}
	return task_wait_fx;
}

ervp_task_wait_fx_t dca_matrix_scalar_mult_fixed(ervp_mop_mapping_t *mop_mapping, const dca_matrix_mac_hwinfo_t *const hwinfo, const ErvpMatrixInfo *ma_info, int scalar_value, ErvpMatrixInfo *mc_info, int options)
{
	scalar_matrix_value.value_signed = scalar_value;
	return dca_matrix_mac_start(mop_mapping, hwinfo, DCA_MAC_SCALAR_MULT, ma_info, &scalar_matrix_info, mc_info, options);
}

ervp_task_wait_fx_t dca_matrix_conv_oneblock(ervp_mop_mapping_t *mop_mapping, const dca_matrix_mac_hwinfo_t *const hwinfo, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, int conv_options)
{
	ervp_mconv_option_t conv_option;
	conv_option.value = conv_options;
	ervp_mop_option_t option;
	option.value = 0;
	option.br.acc = conv_option.br.acc;
	option.br.rshift = conv_option.br.rshift;
	option.br.performs_cliping = conv_option.br.performs_cliping;
	return dca_matrix_mac_start(mop_mapping, hwinfo, DCA_MAC_CONV, ma_info, mb_info, mc_info, option.value);
}

// IMPOSSILE to make dca_matrix_conv_sharedinput
ervp_task_wait_fx_t dca_matrix_conv_oneblock_sharedinput(ervp_mop_mapping_t *mop_mapping, const dca_matrix_mac_hwinfo_t *const hwinfo, int num_output, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo **output_info_list, int conv_options)
{
	assert(num_output);
	ervp_task_wait_fx_t task_wait_fx = NULL;
	ervp_mconv_option_t conv_option;
	conv_option.value = conv_options;

	if (conv_option.br.rshift || conv_option.br.performs_cliping)
	{
		ervp_mop_option_t option;
		option.value = 0;
		option.br.acc = conv_option.br.acc;
		option.br.rshift = conv_option.br.rshift;
		option.br.performs_cliping = conv_option.br.performs_cliping;
		task_wait_fx = dca_matrix_mac_start(mop_mapping, hwinfo, DCA_MAC_CONV, input_info, kernel_info_list[0], output_info_list[0], option.value);
		int opcode_wo_lsu0 = DCA_MAC_CONV & (~DCA_MATRIX_MAC_OPCODE_LSU0_REQ);
		for (int i = 1; i < num_output; i++)
			task_wait_fx = dca_matrix_mac_start(mop_mapping, hwinfo, opcode_wo_lsu0, input_info, kernel_info_list[i], output_info_list[i], option.value);
	}
	else
	{
		int opcode;
		if (conv_option.br.acc)
			opcode = DCA_MAC_CONV_COND | DCA_MATRIX_MAC_OPCODE_LOAD_ACC;
		else
			opcode = DCA_MAC_CONV_COND | DCA_MATRIX_MAC_OPCODE_INIT_ACC;

		cache_flush_smart(-1);
		_dca_matrix_mac_request(hwinfo, opcode, input_info, kernel_info_list[0], output_info_list[0]);
		opcode &= (~DCA_MATRIX_MAC_OPCODE_LSU0_REQ);
		for (int i = 1; i < num_output; i++)
			_dca_matrix_mac_request(hwinfo, opcode, input_info, kernel_info_list[i], output_info_list[i]);
		task_wait_fx = dca_matrix_mac_wait_fx(hwinfo);
	}
	return task_wait_fx;
}

// IMPOSSILE to make dca_matrix_conv_sharedoutput
ervp_task_wait_fx_t dca_matrix_conv_oneblock_sharedoutput(ervp_mop_mapping_t *mop_mapping, const dca_matrix_mac_hwinfo_t *const hwinfo, int num_input, const ErvpMatrixInfo **input_info_list, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo *output_info, int conv_options, int init_ouptut)
{
	assert(num_input);
	ervp_task_wait_fx_t task_wait_fx = NULL;
	ervp_mconv_option_t conv_option;
	conv_option.value = conv_options;
	assert(conv_option.br.acc);

	if (num_input == 1)
	{
		if (init_ouptut)
			conv_option.br.acc = 0;
		task_wait_fx = dca_matrix_conv_oneblock(mop_mapping, hwinfo, input_info_list[0], kernel_info_list[0], output_info, conv_option.value);
	}
	else if (conv_option.br.rshift || conv_option.br.performs_cliping)
	{
		assert(0);
	}
	else
	{
		cache_flush_smart(-1);
		int opcode;
		opcode = DCA_MATRIX_MAC_OPCODE_CONV_COND | DCA_MATRIX_MAC_OPCODE_RSRC_CONSTANT | DCA_MATRIX_MAC_OPCODE_LSU0_REQ | DCA_MATRIX_MAC_OPCODE_LSU1_REQ;
		if (init_ouptut)
			opcode |= DCA_MATRIX_MAC_OPCODE_INIT_ACC;
		else
			opcode |= DCA_MATRIX_MAC_OPCODE_LOAD_ACC;
		_dca_matrix_mac_request(hwinfo, opcode, input_info_list[0], kernel_info_list[0], output_info);

		opcode = DCA_MATRIX_MAC_OPCODE_CONV_COND | DCA_MATRIX_MAC_OPCODE_RSRC_CONSTANT | DCA_MATRIX_MAC_OPCODE_LSU0_REQ | DCA_MATRIX_MAC_OPCODE_LSU1_REQ;
		for (int i = 1; i < (num_input - 1); i++)
		{
			// dca_matrix_mac_wait(hwinfo);
			_dca_matrix_mac_request(hwinfo, opcode, input_info_list[i], kernel_info_list[i], output_info);
		}
		opcode = DCA_MATRIX_MAC_OPCODE_CONV_COND | DCA_MATRIX_MAC_OPCODE_RSRC_CONSTANT | DCA_MATRIX_MAC_OPCODE_LSU0_REQ | DCA_MATRIX_MAC_OPCODE_LSU1_REQ | DCA_MATRIX_MAC_OPCODE_LSU2_REQ;
		_dca_matrix_mac_request(hwinfo, opcode, input_info_list[num_input - 1], kernel_info_list[num_input - 1], output_info);
		task_wait_fx = dca_matrix_mac_wait_fx(hwinfo);
	}
	return task_wait_fx;
}
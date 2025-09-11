#include "platform_info.h"
#include "ervp_printf.h"
#include "ervp_reg_util.h"
#include "mem_1_4.h"
#include "inst.h"
#include "ervp_core_id.h"
#include "ervp_variable_allocation.h"
#include "ervp_memory_util.h"
#include "ervp_platform_api.h"
#include "ervp_fakefile.h"

#define TEST_MEMORY_SIZE  (I_USER_DDR4_SIZE)
#define TEST_SIZE TEST_MEMORY_SIZE

#define HAS(s, sub) (strstr((s), (sub)) != NULL)

static inline unsigned int get_bnn_apb_addr(unsigned int offset)
{
	return (U_BNN_TOP_SLAVE_SLAVE_BASEADDR+offset);
}

int main() {
	void *mem_addr = (void*)I_USER_DDR4_BASEADDR;
	void *output_addr = (void*)(I_USER_DDR4_BASEADDR + 0x100000);
	const uint64_t *rd = (const uint64_t *)output_addr;
	
	int all_are_equal = 1;
	int single_test_size = sizeof(mem_1_4);
	memcpy(mem_addr, mem_1_4, single_test_size);
	flush_cache();
	int mcmp = memory_compare(mem_addr, mem_1_4, single_test_size, 0);
	all_are_equal &= mcmp;
	if(all_are_equal)
		printf("\nmemory all correct");
	else
		printf("\nmemory some incorrect");
	inst_param_t sc_pr;
	if (!inst_fill("shortcut1_4", &sc_pr)) {
		printf("inst_fill_params failed\n");
		return 1;
	}

	for (uint16_t iter=0; iter<sc_pr.iter_last; iter++){
		uint8_t r_cr0 = 0;

		//param setting
		if(iter == 0){
			REG32(get_bnn_apb_addr(0x7F8)) = sc_pr.STATE_UPDATE_CONFIG[0];
		}
		else {
			REG32(get_bnn_apb_addr(0x7F8)) = sc_pr.STATE_UPDATE_CONFIG[1];
		}

		REG32(get_bnn_apb_addr(0x68)) = I_USER_DDR4_BASEADDR;

		REG32(get_bnn_apb_addr(0x10)) = sc_pr.DRAM_BIFMAPOFFSET[0];
		REG32(get_bnn_apb_addr(0x18)) = sc_pr.DRAM_BIFMAPOFFSET[1];
		REG32(get_bnn_apb_addr(0x20)) = sc_pr.DRAM_BIFMAPOFFSET[2];

		REG32(get_bnn_apb_addr(0x200)) = sc_pr.DRAM_FIFMAPOFFSET[0] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);
		REG32(get_bnn_apb_addr(0x208)) = sc_pr.DRAM_FIFMAPOFFSET[1] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);
		REG32(get_bnn_apb_addr(0x210)) = sc_pr.DRAM_FIFMAPOFFSET[2] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);
		REG32(get_bnn_apb_addr(0x218)) = sc_pr.DRAM_FIFMAPOFFSET[3] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);
		REG32(get_bnn_apb_addr(0x220)) = sc_pr.DRAM_FIFMAPOFFSET[4] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);
		REG32(get_bnn_apb_addr(0x228)) = sc_pr.DRAM_FIFMAPOFFSET[5] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);
		REG32(get_bnn_apb_addr(0x230)) = sc_pr.DRAM_FIFMAPOFFSET[6] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);
		REG32(get_bnn_apb_addr(0x238)) = sc_pr.DRAM_FIFMAPOFFSET[7] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);

		REG32(get_bnn_apb_addr(0x240)) = sc_pr.DRAM_FOFMAPOFFSET[0] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);;
		REG32(get_bnn_apb_addr(0x248)) = sc_pr.DRAM_FOFMAPOFFSET[1] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);;
		REG32(get_bnn_apb_addr(0x250)) = sc_pr.DRAM_FOFMAPOFFSET[2] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);;
		REG32(get_bnn_apb_addr(0x258)) = sc_pr.DRAM_FOFMAPOFFSET[3] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);;
		REG32(get_bnn_apb_addr(0x260)) = sc_pr.DRAM_FOFMAPOFFSET[4] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);;
		REG32(get_bnn_apb_addr(0x268)) = sc_pr.DRAM_FOFMAPOFFSET[5] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);;
		REG32(get_bnn_apb_addr(0x270)) = sc_pr.DRAM_FOFMAPOFFSET[6] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);;
		REG32(get_bnn_apb_addr(0x278)) = sc_pr.DRAM_FOFMAPOFFSET[7] + iter*32*(sc_pr.DRAM_FIOFMAPLENGTH/4);;

		REG32(get_bnn_apb_addr(0x28)) = sc_pr.DRAM_BIFMAPLENGTH;

		REG32(get_bnn_apb_addr(0x2a8)) = 0x04;

		if(HAS(sc_pr.SCENARIO_NAME, "shortcut0")) {
			REG32(get_bnn_apb_addr(0x30)) = sc_pr.DRAM_PEA_BWEIGHTOFFSET[0] + iter*(sc_pr.DRAM_BWEIGHTLENGTH[0] << 3);
			REG32(get_bnn_apb_addr(0x38)) = sc_pr.DRAM_PEA_BWEIGHTOFFSET[1] + iter*(sc_pr.DRAM_BWEIGHTLENGTH[0] << 3);
			REG32(get_bnn_apb_addr(0x40)) = sc_pr.DRAM_PEA_BWEIGHTOFFSET[2] + iter*(sc_pr.DRAM_BWEIGHTLENGTH[0] << 3);
			REG32(get_bnn_apb_addr(0x48)) = sc_pr.DRAM_BWEIGHTLENGTH[0];

			REG32(get_bnn_apb_addr(0x50)) = sc_pr.DRAM_PEA_ALPHAOFFSET + iter*(8 << 3);
			REG32(get_bnn_apb_addr(0x58)) = sc_pr.DRAM_PEA_BETAOFFSET + iter*(8 << 3);
			REG32(get_bnn_apb_addr(0x60)) = sc_pr.DRAM_CLENGTH[0];
		}
		else{
			REG32(get_bnn_apb_addr(0x30)) = sc_pr.DRAM_PEA_BWEIGHTOFFSET[0] + iter*(sc_pr.DRAM_BWEIGHTLENGTH[1] << 3);
			REG32(get_bnn_apb_addr(0x38)) = sc_pr.DRAM_PEA_BWEIGHTOFFSET[1] + iter*(sc_pr.DRAM_BWEIGHTLENGTH[1] << 3);
			REG32(get_bnn_apb_addr(0x40)) = sc_pr.DRAM_PEA_BWEIGHTOFFSET[2] + iter*(sc_pr.DRAM_BWEIGHTLENGTH[1] << 3);
			REG32(get_bnn_apb_addr(0x48)) = sc_pr.DRAM_BWEIGHTLENGTH[1];

			REG32(get_bnn_apb_addr(0x288)) = sc_pr.DRAM_LPEA_BWEIGHTOFFSET[0] + iter*(sc_pr.DRAM_LPEA_BWEIGHTLENGTH << 3);
			REG32(get_bnn_apb_addr(0x290)) = sc_pr.DRAM_LPEA_BWEIGHTOFFSET[1] + iter*(sc_pr.DRAM_LPEA_BWEIGHTLENGTH << 3);
			REG32(get_bnn_apb_addr(0x298)) = sc_pr.DRAM_LPEA_BWEIGHTOFFSET[2] + iter*(sc_pr.DRAM_LPEA_BWEIGHTLENGTH << 3);
			REG32(get_bnn_apb_addr(0x2a0)) = sc_pr.DRAM_LPEA_BWEIGHTLENGTH;

			REG32(get_bnn_apb_addr(0x50)) = sc_pr.DRAM_PEA_ALPHAOFFSET + iter*(8 << 3);
			REG32(get_bnn_apb_addr(0x58)) = sc_pr.DRAM_PEA_BETAOFFSET + iter*(8 << 3);
			REG32(get_bnn_apb_addr(0x60)) = sc_pr.DRAM_CLENGTH[1];

			REG32(get_bnn_apb_addr(0x9f8)) = sc_pr.PW_W_ADDR_OFFSET;
			REG32(get_bnn_apb_addr(0xa00)) = sc_pr.PW_W_ADDR_OFFSET;
			REG32(get_bnn_apb_addr(0xa08)) = sc_pr.PW_W_ADDR_OFFSET;
		}

		REG32(get_bnn_apb_addr(0x70)) = sc_pr.DRAM_FIOFMAPLENGTH;

		REG32(get_bnn_apb_addr(0x280)) = sc_pr.DRAM_CTRL_HEIGHT_LEN;

		REG32(get_bnn_apb_addr(0x78)) = 0x03;

		REG32(get_bnn_apb_addr(0x80)) = 0x03;

		REG32(get_bnn_apb_addr(0x88)) = 0x03;

		REG32(get_bnn_apb_addr(0x90)) = 0x03;

		REG32(get_bnn_apb_addr(0x850)) = sc_pr.FOFMAP_ADDR_OFFSET_SHIFTED;
		REG32(get_bnn_apb_addr(0x858)) = sc_pr.FOFMAP_ADDR_OFFSET_SHIFTED;
		REG32(get_bnn_apb_addr(0x860)) = sc_pr.FOFMAP_ADDR_OFFSET_SHIFTED;
		REG32(get_bnn_apb_addr(0x868)) = sc_pr.FOFMAP_ADDR_OFFSET_SHIFTED;
		REG32(get_bnn_apb_addr(0x870)) = sc_pr.FOFMAP_ADDR_OFFSET_SHIFTED;
		REG32(get_bnn_apb_addr(0x878)) = sc_pr.FOFMAP_ADDR_OFFSET_SHIFTED;
		REG32(get_bnn_apb_addr(0x880)) = sc_pr.FOFMAP_ADDR_OFFSET_SHIFTED;
		REG32(get_bnn_apb_addr(0x888)) = sc_pr.FOFMAP_ADDR_OFFSET_SHIFTED;

		REG32(get_bnn_apb_addr(0x948)) = 0;
		REG32(get_bnn_apb_addr(0x950)) = sc_pr.PW_W_ADDR_OFFSET;
		REG32(get_bnn_apb_addr(0x958)) = 0;
		REG32(get_bnn_apb_addr(0x960)) = sc_pr.PW_C_ADDR_OFFSET;

		REG32(get_bnn_apb_addr(0x8d0)) = sc_pr.STRIDE_LENGTH;
		REG32(get_bnn_apb_addr(0x8d8)) = sc_pr.IFMAP_WIDTH_LENGTH;
		REG32(get_bnn_apb_addr(0x8e0)) = sc_pr.IFMAP_HEIGHT_LENGTH;
		REG32(get_bnn_apb_addr(0x8e8)) = sc_pr.KERNEL_CHANNEL_RANGE;

		REG32(get_bnn_apb_addr(0x8f0)) = sc_pr.IFMAP_CTRL_HEIGHT;
		REG32(get_bnn_apb_addr(0x8f8)) = sc_pr.IFMAP_CTRL_HEIGHT;

		REG32(get_bnn_apb_addr(0x900)) = sc_pr.KERNEL_SIDE_LENGTH;
		REG32(get_bnn_apb_addr(0x908)) = sc_pr.KERNEL_SIDE_LENGTH;
		REG32(get_bnn_apb_addr(0x910)) = sc_pr.KERNEL_CHANNEL_RANGE;
		
		REG32(get_bnn_apb_addr(0x918)) = 0xFFFFFFFF;

		REG32(get_bnn_apb_addr(0x920)) = sc_pr.OFMAP_CHANNEL_RANGE;

		REG32(get_bnn_apb_addr(0x928)) = 7;
		REG32(get_bnn_apb_addr(0x930)) = 7;

		REG32(get_bnn_apb_addr(0x938)) = sc_pr.FOFMAP_ADDR_OFFSET;

		REG32(get_bnn_apb_addr(0x940)) = sc_pr.LAYER_OPS_TYPE;

		REG32(get_bnn_apb_addr(0x948)) = sc_pr.CONV_W_ADDR_OFFSET;
		REG32(get_bnn_apb_addr(0x950)) = sc_pr.PW_W_ADDR_OFFSET;
		REG32(get_bnn_apb_addr(0x958)) = sc_pr.CONV_C_ADDR_OFFSET;
		REG32(get_bnn_apb_addr(0x960)) = sc_pr.PW_C_ADDR_OFFSET;

		REG32(get_bnn_apb_addr(0x968)) = 4*(iter + 1);

		REG32(get_bnn_apb_addr(0x970)) = 1 << sc_pr.DIVIDE_FACTOR;

		REG32(get_bnn_apb_addr(0x978)) = 7;
		REG32(get_bnn_apb_addr(0x980)) = 7;
		REG32(get_bnn_apb_addr(0x988)) = 0;
		REG32(get_bnn_apb_addr(0x990)) = 0;
		REG32(get_bnn_apb_addr(0x998)) = 0;
		REG32(get_bnn_apb_addr(0x9a0)) = 0;
		REG32(get_bnn_apb_addr(0x9a8)) = 0;
		REG32(get_bnn_apb_addr(0x9b0)) = 0;

		if(iter != 0){
			uint32_t r_busy;
			uint32_t PADDR_CR0 = REG32(get_bnn_apb_addr(0x7F0));
			r_busy = (PADDR_CR0 >> 2) & 0x1u;
            do {
                PADDR_CR0 = REG32(get_bnn_apb_addr(0x7F0));
                r_busy = (PADDR_CR0 >> 2) & 0x1;
            } while (r_busy == 1);

            REG32(get_bnn_apb_addr(0x7F0)) = 0x40;
		}

		r_cr0 |= 0x00000002;
		if (iter == sc_pr.iter_last - 1) {
            r_cr0 |= 0x00000010;
		}
		
		REG32(get_bnn_apb_addr(0x7F0)) = r_cr0;
		REG32(get_bnn_apb_addr(0x08)) = 0x1;
	}
	int output_matched = 1;
	int output_single_test_size = sizeof(ofmap_1_4);
	printf("\noutput_single_test_size: %u", output_single_test_size);
	int omcmp = memory_compare(output_addr, ofmap_1_4, output_single_test_size, 0);
	printf("\n%s ", sc_pr.SCENARIO_NAME);
	printf("output memory compare: %u", omcmp);
	output_matched &= omcmp;
	printf("\noutput_matched: %u", output_matched);

    if(output_matched){
      	printf("\noutput correct");
	}
    else {
      	printf("\noutput incorrect");
		for (size_t i = 0; i < 5; ++i)
			printf("\nidx %zu  EXPECT 0x%016llX  READ 0x%016llX",
				i, ofmap_1_4[i], rd[i]);
			}
	return 0;
}

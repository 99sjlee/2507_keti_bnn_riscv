#ifndef INST_H
#define INST_H

#include <stdint.h>
#include <stdbool.h>

typedef struct {
    uint32_t    output_size;

    const char  *SCENARIO_NAME;

    uint8_t     OFMAP_WIDTH_LENGTH;
    uint8_t     OFMAP_HEIGHT_LENGTH;

    uint8_t     TARGET_OFMAP_NUM;

    uint8_t     STATE_UPDATE_CONFIG[2];
 
    uint32_t    DRAM_BIFMAPOFFSET[3];

    uint32_t    DRAM_FIFMAPOFFSET[8];

    uint32_t    DRAM_FOFMAPOFFSET[8];

    uint32_t    DRAM_BIFMAPLENGTH;

    uint32_t    DRAM_PEA_BWEIGHTOFFSET[3];

    uint16_t    DRAM_BWEIGHTLENGTH[2];
    uint32_t    DRAM_LPEA_BWEIGHTOFFSET[3]; //only shortcut1
    uint16_t    DRAM_LPEA_BWEIGHTLENGTH; //only shortcut1
    uint32_t    DRAM_PEA_ALPHAOFFSET;
    uint32_t    DRAM_PEA_BETAOFFSET;
    uint16_t    DRAM_CLENGTH[2];

    uint8_t     DRAM_FIOFMAPLENGTH;
    uint8_t     DRAM_CTRL_HEIGHT_LEN;
    uint8_t     FOFMAP_ADDR_OFFSET_SHIFTED;

    uint8_t     STRIDE_LENGTH;
    uint8_t     IFMAP_WIDTH_LENGTH;
    uint8_t     IFMAP_HEIGHT_LENGTH;
    uint8_t     KERNEL_CHANNEL_RANGE;
    uint8_t     IFMAP_CTRL_HEIGHT;
    uint8_t     KERNEL_SIDE_LENGTH;
    uint8_t     OFMAP_CHANNEL_RANGE;
    uint8_t     FOFMAP_ADDR_OFFSET;

    uint16_t    CONV_W_ADDR_OFFSET;
    uint16_t    PW_W_ADDR_OFFSET;
    uint16_t    CONV_C_ADDR_OFFSET;
    uint16_t    PW_C_ADDR_OFFSET;

    uint8_t     LAYER_OPS_TYPE;
    uint8_t     DIVIDE_FACTOR;
    uint8_t     iter_last;
} inst_param_t;

bool inst_fill(const char *shortcut, inst_param_t *out);

#endif
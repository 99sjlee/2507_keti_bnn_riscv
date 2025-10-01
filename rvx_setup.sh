#!/bin/bash

export RVX_MINI_HOME=/home/sjlee/2507_keti_bnn_riscv

export RVX_SSW_HOME=${RVX_MINI_HOME}/rvx_ssw

if [ -f ${RVX_MINI_HOME}/rvx_binary/rvx_setup.sh ]
then
source ${RVX_MINI_HOME}/rvx_binary/rvx_setup.sh
fi

if [ -d ${RVX_MINI_HOME}/rvx_synthesizer ]
then
export RVX_SYNTHESIZER_HOME=${RVX_MINI_HOME}/rvx_synthesizer
else
if [ -d ${RVX_MINI_HOME}/rvx_synthesizer_limited ]
then
export RVX_SYNTHESIZER_HOME=${RVX_MINI_HOME}/rvx_synthesizer_limited
else
if [ -d ${RVX_MINI_HOME}/rvx_synthesizer_obfuscated ]
then
export RVX_SYNTHESIZER_HOME=${RVX_MINI_HOME}/rvx_synthesizer_obfuscated
fi
fi
fi

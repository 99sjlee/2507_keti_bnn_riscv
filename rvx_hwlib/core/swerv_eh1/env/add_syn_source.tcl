## ****************************************************************************
## ****************************************************************************
## Copyright SoC Design Research Group, All rights reservxd.
## Electronics and Telecommunications Research Institute (ETRI)
## 
## THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
## WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
## TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
## REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
## SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
## IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
## COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
## ****************************************************************************
## 2024-10-04
## Kyuseung Han (han@etri.re.kr)
## ****************************************************************************
## ****************************************************************************

set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/swerv_eh1/pkg/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/swerv_eh1/dbg/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/swerv_eh1/dec/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/swerv_eh1/dma/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/swerv_eh1/exu/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/swerv_eh1/ifu/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/swerv_eh1/lib/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/swerv_eh1/lsu/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/swerv_eh1/pic/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/swerv_eh1/top_src/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/swerv_eh1/top_src/*.v]
lappend verilog_include_list ${RVX_HWLIB_HOME}/core/swerv_eh1/include
lappend verilog_include_list ${RVX_HWLIB_HOME}/core/swerv_eh1/include
lappend define_list SYNTHESIS
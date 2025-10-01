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
## 2024-01-18
## Kyuseung Han (han@etri.re.kr)
## ****************************************************************************
## ****************************************************************************

set vhdl_module_list [concat_file_list $vhdl_module_list ${RVX_HWLIB_HOME}/cache/src/*.{vhd,vhdl}]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/cache/src/*.v]
lappend vhdl_include_list ${RVX_HWLIB_HOME}/cache/include
set vhdl_module_list [concat_file_list $vhdl_module_list ${RVX_HWLIB_HOME}/core/orca_plus/src/*.{vhd,vhdl}]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/orca_plus/src/*.v]
lappend vhdl_include_list ${RVX_HWLIB_HOME}/core/orca_plus/include
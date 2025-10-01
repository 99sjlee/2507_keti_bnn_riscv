## ****************************************************************************
## ****************************************************************************
## Copyright SoC Design Research Group, All rights reserved.    
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
## 2017-01 : Kyuseung Han (han@etri.re.kr)
## ****************************************************************************
## ****************************************************************************

source ${RVX_HWLIB_HOME}/peripheral/uart/env/add_syn_source.tcl
source ${RVX_HWLIB_HOME}/peripheral/spi/env/add_syn_source.tcl
source ${RVX_HWLIB_HOME}/peripheral/i2c/env/add_syn_source.tcl
source ${RVX_HWLIB_HOME}/peripheral/gpio/env/add_syn_source.tcl

set verilog_module_list [concat $verilog_module_list [glob ${RVX_HWLIB_HOME}/peripheral/external_peri_group/src/*.v]]
lappend verilog_include_list ${RVX_HWLIB_HOME}/peripheral/external_peri_group/include

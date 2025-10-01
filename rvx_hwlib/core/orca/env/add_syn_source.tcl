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
## 2021-03-02
## Kyuseung Han (han@etri.re.kr)
## ****************************************************************************
## ****************************************************************************

source ${RVX_HWLIB_HOME}/core/orca_cache/env/add_syn_source.tcl
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_HOME}/core/orca/src/*.v]
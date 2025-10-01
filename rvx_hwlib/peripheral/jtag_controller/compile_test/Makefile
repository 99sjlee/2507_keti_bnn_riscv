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
## 2016-12
## Kyuseung Han (han@etri.re.kr)
## ****************************************************************************
## ****************************************************************************

# Makefile version : 170111

LIB_DIR_LIST = ../../../lib_rtl/src ../../jtag_controller/src
SRC_DIR_LIST = ../src
SRC_FILE_LIST =

INC_DIR_LIST = ../include ../../../lib_rtl/include ../../jtag_controller/include

TOP_MODULE = 

all: clean_verilog compile_each_verilog
clean: clean_verilog

# DO NOT modify below
ENV_DIR = ${RVX_HWLIB_HOME}/env
include $(ENV_DIR)/compile_hdl/compile_hdl.mh

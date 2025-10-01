# ****************************************************************************
# ****************************************************************************
# Copyright SoC Design Research Group, All rights reserved.
# Electronics and Telecommunications Research Institute (ETRI)
# 
# THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
# WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
# TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
# REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
# SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
# IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
# COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
# ****************************************************************************
# 2019-04-29
# Kyuseung Han (han@etri.re.kr)
# ****************************************************************************
# ****************************************************************************

ifndef RVX_ETRI_HOME
	$(error source the rvs_setup script in RVX_ETRI_HOME)
endif

VERSION_INFO_FILE=${CURDIR}/version_info.xml

ORIGINAL_FILE_LIST=README.md Makefile ${VERSION_INFO_FILE}
-include ${RVX_UTIL_HOME}/distclean.mh
GIT_REMOTE_URL=git@bitbucket.org:kyuseung_han/rvx_hwlib.git
-include ${RVX_UTIL_HOME}/remove_git_history.mh

clean: distclean
	git checkout .

remove_unused:
	#rm -rf ./core/swerv_eh1
	rm -rf ./core/biriscv
	rm -rf ./core/rocket_jtag
	rm -rf ./core/rocket*/splited
	rm -rf ./core/rocket*/scala
	rm -rf ./core/rocket*/imported
	rm -rf ./peripheral/vdma
	rm -rf ./peripheral/fuse_box
	rm -rf ./peripheral/platform_controller_old
	rm -rf ./lpi_backup
	rm -rf ./munoc/src/gravity_*

update: gen_git_info
	cd ${RVX_DEV_UTIL_HOME} && make hwlib TARGET_HWLIB=${CURDIR}
	make remove_unused
	git add -A ./lib_fpga
	git add -A ./lib_sim
	git add -A ./lib_rtl
	git add -A ./peripheral
	git add -A ./core
	git add -A ./munoc
	git add -A ./cache
	git add -A ${VERSION_INFO_FILE}

gen_git_info:
	rm -rf ${VERSION_INFO_FILE}
	python3 ${RVX_SHARED_HOME}/rvx_util/manage_version_info.py -git ${RVX_ETRI_HOME} -o ${VERSION_INFO_FILE}
	cat ${VERSION_INFO_FILE}

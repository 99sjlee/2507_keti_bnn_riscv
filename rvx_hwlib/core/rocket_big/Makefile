TEMPLATE_FILE = ${RVX_DEV_UTIL_HOME}/makefile_template/Makefile.rocket-v1.6.template
TEMPLATE_CONFIG = "ROCKET_VERSION=v1.6" "ROCKET_CONFIG_NAME=RvcRocketBig32Config" "GENERATED_SRC_DIR=~/riscv_git/rocket-chip/vsim/generated-src"
include ${RVX_UTIL_HOME}/template_makefile.mh

ROCKET_VERSION=v1.6
ROCKET_CONFIG_NAME=RvcRocketBig32Config

GENERATED_SRC_DIR=~/riscv_git/rocket-chip/vsim/generated-src

IMPORT_DIR_NAME = imported
TARGET_DIR_NAME = src
MANUAL_DIR_NAME = manual

IMPORT_DIR = ${CURDIR}/${IMPORT_DIR_NAME}
TARGET_DIR = ${CURDIR}/${TARGET_DIR_NAME}
MANUAL_DIR = ${CURDIR}/${MANUAL_DIR_NAME}

GENERATED_PREFIX=freechips.rocketchip.system

ROCKET_NAME=${GENERATED_PREFIX}.${ROCKET_CONFIG_NAME}
ROCKET_FILE=${IMPORT_DIR}/${ROCKET_NAME}.v

PORTING_OP_LIST = rollback header random asynch reset split_register tab remind tidy unused bug

INFO_FILE=${CURDIR}/git_info.txt

update: import porting

update2: update split

clean: clean_import clean_porting

clean_import:
	rm -rf ./${IMPORT_DIR_NAME}

clean_porting:
	rm -rf ./${TARGET_DIR_NAME}

import: clean_import
	mkdir ./${IMPORT_DIR_NAME}
	cp -f ${GENERATED_SRC_DIR}/${ROCKET_NAME}.v ${IMPORT_DIR}
	cp -f ${GENERATED_SRC_DIR}/${ROCKET_NAME}.behav_srams.v ${IMPORT_DIR}
	cp -f ${GENERATED_SRC_DIR}/*${ROCKET_CONFIG_NAME}.dts ${IMPORT_DIR}
	-cp -f ${GENERATED_SRC_DIR}/../../vsrc/plusarg_reader.v ${IMPORT_DIR}
	-cp -f ${GENERATED_SRC_DIR}/${ROCKET_NAME}/plusarg_reader.v ${IMPORT_DIR}
	rm -rf ./scala
	cp -r ${GENERATED_SRC_DIR}/../../src/main/scala .
	python3 ${RVX_UTIL_HOME}/generate_git_info.py -cmd url -p ${GENERATED_SRC_DIR} -o ${INFO_FILE}
	python3 ${RVX_UTIL_HOME}/generate_git_info.py -cmd version -p ${GENERATED_SRC_DIR} -o ${INFO_FILE}  --append
	cat ${INFO_FILE}

${PORTING_OP_LIST}:
	python3 ${RVX_DEV_UTIL_HOME}/modify_rocket-v1.6.py -p ${TARGET_DIR} -op $@

porting: clean_porting split tidy unused bug header overwrite_manual
#porting: clean_porting split tidy unused header reset split_register random overwrite_manual

sram:
	git checkout ${TARGET_DIR}/${ROCKET_NAME}.behav_srams.v

split: clean_porting
	mkdir ./${TARGET_DIR_NAME}
	python3 ${RVX_DEV_UTIL_HOME}/module_spliter.py -i ${ROCKET_FILE} -o ${TARGET_DIR}
	cd ${IMPORT_DIR} && cp *.v ${TARGET_DIR}
	rm -rf ${TARGET_DIR}/${ROCKET_NAME}.v

overwrite_manual:
	-cd ${MANUAL_DIR} && cp -r * ${TARGET_DIR}

# ./run_big and ./run_medium @GENERATED_SRC_DIR
# make update2 @CURDIR

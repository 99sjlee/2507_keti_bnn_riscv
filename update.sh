#!/bin/bash
git pull origin master
git submodule init
git submodule update --force
make reconfig_python
make config
source ./rvx_setup.sh
make after_update
make check
make sync
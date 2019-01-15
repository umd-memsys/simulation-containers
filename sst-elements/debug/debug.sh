#!/usr/bin/env bash

# This script will take your source code, mount it into a container
# and run a test/debug program in that container
# it won't work unless you have the directories set correctly

# sst-elements source direcotry
SST_ELEMENTS=/host/path/to/sst-elements
# DRAMSim3 source directory
DRAMSIM3=/host/path/to/DRAMSim3
# runtime directories (where you put *.py, *.ini, *.cfg)
RUNTIME=/host/path/to/your/runtime/

# use bind mount to enable incremental compilation
# do not change the targets
docker run -it \
--mount type=bind,source="$SST_ELEMENTS",target=/sst-elements \
--mount type=bind,source="$DRAMSIM3",target=/home/DRAMSim3 \
--mount type=bind,source="$RUNTIME",target=/home/run \
sst-elements \
/bin/bash -c \
"cd /sst-elements &&"\
"if ! [ -e configure ]; then "\
"./autogen.sh &&"\
"./configure --prefix=/home/sst-elements "\
"--with-sst-core=/home/sst-core "\
"--with-dramsim3=/home/DRAMSim3; "\
"fi; "\
"make all install &&"\
"cd /home/run &&"\
"sst genCFG.py"

SHELL := /bin/bash

BEFOREALL=copy
TARGET=etherCAT_Hand_User_Manual
include Makefile.include

ifeq ($(ROSINSTALL),)
$(error ROSINSTALL is not set, please use make path/to/rosinstall)
endif

.PHONY: copy

copy:
	./get_changelogs.sh ${ROSINSTALL}

#echo ${ROSINSTALL}
#ifndef ${ROSINSTALL}
#	$(error ROSINSTALL is not set, please use make path/to/rosinstall)
#endif
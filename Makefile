SHELL := /bin/bash

BEFOREALL=copy
TARGET=etherCAT_Hand_User_Manual
include Makefile.include

.PHONY: copy

copy:
	./get_changelogs.sh
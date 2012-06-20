SHELL := /bin/bash

TARGET=etherCAT_Hand_User_Manual
include Makefile.include

STACKS=(shadow_robot shadow_robot_ethercat)

copy:
  for (( i = 0 ; i < ${#STACKS[@]} ; i++ )) do
    if [ -f `rosstack find ${STACKS[$i]}`/changelog.tex ] then
      cp `rosstack find ${STACKS[$i]}`/changelog.tex changelogs/file${i}.tex
    fi
  done;
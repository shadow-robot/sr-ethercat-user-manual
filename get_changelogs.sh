#!/bin/bash

STACKS=(shadow_robot shadow_robot_ethercat sr_contrib sr_demo sr_visualization sr_teleop denso object_manipulation sr_object_manipulation sr_config)

for (( i = 0 ; i < ${#STACKS[@]} ; i++ )); do
  echo ${STACKS[$i]}
  if [ -f `rosstack find ${STACKS[$i]}`/changelog.tex ]; then
    cp `rosstack find ${STACKS[$i]}`/changelog.tex changelogs/file${i}.tex
  fi
done;
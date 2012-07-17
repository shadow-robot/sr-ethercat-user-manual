#!/bin/bash

#first we delete the existing changelog:
rm -rf changelogs/*

TMP_STACKS=`awk < $1 ' $1=="local-name:" { print $2 }'`
#split in an array
STACKS=($(echo ${TMP_STACKS} | tr " " "\n"))

for (( i = 0 ; i < ${#STACKS[@]} ; i++ )); do
  echo "getting changelog[$i]: "${STACKS[$i]}
  if [ -f `rosstack find ${STACKS[$i]}`/changelog.tex ]; then
    cp `rosstack find ${STACKS[$i]}`/changelog.tex changelogs/file${i}.tex
  fi
done;
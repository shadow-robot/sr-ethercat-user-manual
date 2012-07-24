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

#run latexdiff against the backup
bzr revert etherCAT_Hand_User_Manual.tex.bak
latexdiff etherCAT_Hand_User_Manual.tex etherCAT_Hand_User_Manual.tex.bak >  etherCAT_Hand_User_Manual_diff.tex
pdflatex etherCAT_Hand_User_Manual_diff.tex

#then backup the current version of the tex file
cp etherCAT_Hand_User_Manual.tex etherCAT_Hand_User_Manual.tex.bak

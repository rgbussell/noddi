#!/bin/sh

for file in `ls ./`
do
 echo $file
 rm ./$file/Study01/*
 mv ./$file/Study01/Subject01/AMICO/NODDI/FIT_*.nii.gz $file
 rm -rf ./$file/Study01
done

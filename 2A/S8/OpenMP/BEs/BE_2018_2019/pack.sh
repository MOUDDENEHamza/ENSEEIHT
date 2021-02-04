#!/bin/bash

make clean;
mkdir $USER
cp -r responses.txt band_matrix lu_tasks norm2_noowr stacks tree_branch $USER;
cd $USER; find . -name "*.pdf" | xargs rm; cd ..;
tar zcvf $USER.tgz $USER;
rm -rf $USER;

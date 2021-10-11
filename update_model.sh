#!/bin/bash
path=`pwd`
for dir in $path/models/*; do
    cd $dir
    xmacro4sdf model.sdf.xmacro
done

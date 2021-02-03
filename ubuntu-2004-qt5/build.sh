#!/bin/bash

set -e
cwd=$(pwd)
IFS=$'\n'

counter=$(find . -iname "*.pro" | wc -l)
find . -type f -name "*.pro" | while read file; do
    cd $(dirname $file)
    qmake $(basename $file)
    make
    cd $cwd
done

if [ $counter -eq 0 ] && [ -f "CMakeLists.txt" ]; then
    counter=1
    mkdir /build
    cd /build
    cmake $cwd
    make
fi

if [ $counter -eq 0 ]; then
    echo "No Qt or CMake projects found." 1>&2
    exit 1
fi

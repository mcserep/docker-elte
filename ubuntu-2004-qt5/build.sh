#!/bin/bash

set -e
cwd=$(pwd)
IFS=$'\n'
find . -type f -name "*.pro" | while read file; do
    cd $(dirname $file)
    qmake $(basename $file)
    make
    cd $cwd
done
counter=$(find . -iname "*.pro" | wc -l)
if [ $counter -eq 0 ]; then
    echo "No Qt projects found." 1>&2
    exit 1
fi

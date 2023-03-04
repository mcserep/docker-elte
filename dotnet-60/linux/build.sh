#!/bin/bash

set -e
cwd=$(pwd)
IFS=$'\n'

counter=$(find . -iname "*.sln" | wc -l)
find . -type f -name "*.sln" | while read file; do
    echo "Now building: $file"
    dotnet build $file
    cd $cwd
done

if [ $counter -eq 0 ]; then
    echo "No Visual Studio solutions found." 1>&2
    exit 1
fi

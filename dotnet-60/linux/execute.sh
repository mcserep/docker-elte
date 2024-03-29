#!/bin/bash

set -e
IFS=$'\n'
STDIN=$(</dev/stdin)

counter=$(find . -iname "*.csproj" | wc -l)
if [ $counter -eq 0 ]; then
    echo "No Visual Studio projects found." 1>&2
    exit 1
fi

find . -type f -name "*.csproj" | while read file; do
    if grep -q "<OutputType>Exe</OutputType>" "$file"; then
      dotnet run -c Release --no-build --project "$file" "$@" <<< $STDIN
      break
    fi
done

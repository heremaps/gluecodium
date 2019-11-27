#!/bin/bash
# Parses changes for a given version from CHANGELOG.md
# Parameters: FILE RELEASE
line_range=$(grep -n "^## " "$1" | grep "$2" -A 1 | cut -d ":" -f 1)
OLD_IFS="$IFS"
IFS=$'\n' from_to=(${line_range})
IFS=$OLD_IFS
from=$(( ${from_to[0]} + 1 ))
to=$(( ${from_to[1]} -2 ))
sed -n "${from},${to}p" $1


#!/bin/bash

# Use:  In the .muse/config specify:
# ```
# customTools = "https://scripts.muse.dev/line-length.sh LENGTH SUBDIR"
# ```
dir=$1
commit=$2
cmd=$3
length=${4:-80}
subdir=$5

echo $cmd

if [ -z ${subdir} ] ; then
    subdir=$dir
else
    subdir="$dir/$subdir"
fi

if [[ "$cmd" = "run" ]] ; then
    lines=$(cd ${subdir} ; grep -IHnR ".\{${length}\}" * 2>/dev/null)
    echo "["
    SEP=""
    if [ -z $lines ] ; then
        echo "]"
        exit 0
    fi
    while read -r i ; do
        file=$(echo $i | cut -d ':' -f 1)
        line=$(echo $i | cut -d ':' -f 2)
        echo ${SEP}
        SEP=","
        echo "{"
        echo "\"type\" : \"Line Length\","
        echo "\"message\" : \"Line ${line} is too long (>${length})\","
        echo "\"file\" : \"${file}\","
        echo "\"line\" : ${line}"
        echo "}"
    done <<< "${lines}"
    echo "]"
fi

if [[ "$cmd" = "applicable" ]] ; then
    echo "true"
fi

if [[ "$cmd" = "version" ]] ; then
    echo 1
fi

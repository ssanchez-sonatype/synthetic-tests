#!/bin/bash

# This script conforms to the Muse Script API v1, providing
# a 'version',  'applicable <path>', and 'run <path>` operation.

declare -a patterns
patterns=(XXX TODO FIXME)

directory=$1
commit=$2
command=$3

git checkout $commit 2>/dev/null 1>/dev/null

SEP=""

check_for_bad_pattern() {
    local pattern=$1
    lines=$(grep -H -i -n "$pattern" * -R 2>/dev/null | \
            grep -v 'check-common-comments')
    while read -r i ; do
        file=$(echo $i | cut -d ':' -f 1)
        line=$(echo $i | cut -d ':' -f 2)
        echo ${SEP}
        SEP=","
        echo "{"
        echo "\"tnType\" : \"$pattern\","
        echo "\"tnDesc\" : \"Marker found at line $line\","
        echo "\"tnFile\" : \"$file\","
        echo "\"tnLine\" : $line,"
        echo "\"tnPhase\" : \"PhaseUnknown\","
        echo "\"tnTool\" : {\"tag\":\"CustomTool\",\"contents\":\"check-common-comments.sh\"}"
        echo "}"
    done <<< "$lines"
}

if [[ "$command" = "version" ]] ; then
    echo "1"
    exit 0
elif [[ "$command" = "applicable" ]] ; then
    echo "true"
    exit 0
elif [[ "$command" = "run" ]] ; then
    pushd $directory 1>/dev/null 2>&1
    echo "{ "
    echo " \"tag\": \"ToolSuccess\","
    echo " \"contents\": [["
    for i in ${patterns[@]} ; do
        check_for_bad_pattern "$i"
    done
    echo "] ,null] }"
    popd 1>/dev/null 2>&1
else
    exit 1
fi

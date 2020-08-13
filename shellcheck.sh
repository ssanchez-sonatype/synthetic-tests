#!/bin/bash

# Does not run and print zero results when testvar is set to null

cmd=$3
shift
shift
shift

if [ "$TESTVAR" = "null" ] ; then
    cmd=""
    echo "[]"
fi

if [[ "$cmd" = "run" ]] ; then
    jsonout=$(find . -executable -name '*.sh' -print0 | xargs --null shellcheck -S error -f json "$@")
    if [[ ! ( "[]" = "$jsonout" ) ]] ; then
        echo "$jsonout" | jq --arg type ShellCheck 'map (. + {type: $type})'
    else
        echo "$jsonout"
    fi
fi

if [[ "$cmd" = "applicable" ]] ; then
    echo "true"
fi

if [[ "$cmd" = "version" ]] ; then
    echo "1"
fi

#!/usr/bin/env bash

cmd=$3

if [[ "$cmd" = "run" ]] ; then
    echo "["

    javaPath=$(which javac 2> /dev/null)
    if [[ $javaPath =~ "java-8" ]]; then
        echo "{ \"type\": \"JavaPath\", \"line\": 0, \"message\": \"$javaPath\", \"file\": \"none\" }"
        echo ","
    fi

    if [[ $JAVA_HOME =~ "java-8" ]]; then
        echo "{ \"type\": \"JavaHome\", \"line\": 0, \"message\": \"$JAVA_HOME\", \"file\": \"none\" }"
    fi

    echo "]"
fi

if [[ "$cmd" = "name" ]] ; then
    echo "jdk8-checker"
fi

if [[ "$cmd" = "applicable" ]] ; then
    echo "true"
fi

if [[ "$cmd" = "version" ]] ; then
    echo "1"
fi

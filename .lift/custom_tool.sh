#!/bin/bash

function tellApplicable() {
    echo "Writes a file in the repository" > test.text

    echo "true"

    return $?
}

function tellVersion() {
    echo "1"
    return 0
}

function run() {
    echo "[]"
    RESULT=$?
    return $RESULT
}

function tellName() {
    echo "Example of a tool that writes output"
    return 0
}

case "$3" in
    run)
        run "$1" "$2" "$3"
        ;;
    applicable)
        tellApplicable "$1" "$2" "$3"
        ;;
    name)
        tellName
        ;;
    *)
        tellVersion
        ;;
esac
exit $?

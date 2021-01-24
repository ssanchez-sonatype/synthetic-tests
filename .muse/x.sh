#!/usr/bin/env bash
function tellApplicable() {
    printf "true\n" "$res"
}

function tellVersion() {
    echo "3"
}

function run() {
        date >> /tmp/x.sh.run.log
        echo "Args: $*" >> /tmp/x.sh.run.log
        printf "Stdin: " >> /tmp/x.sh.run.log
        cat <&0 >> /tmp/x.sh.run.log
        echo '{ "toolNotes" : [
                   { "type" : "type during run",
                     "message" : "run message",
                     "file" : "a.c",
                     "line" : 3,
                     "noteId" : "noteid"
                   }
               ]}'
}

function finalize() {
        date >> /tmp/x.sh.finalize.log
        echo "Args: $*" >> /tmp/x.sh.finalize.log
        printf "Stdin: " >> /tmp/x.sh.finalize.log
        cat <&0 >> /tmp/x.sh.finalize.log
        echo '{ "toolNotes" : [
                { "type" : "type during run",
                  "message" : "run message",
                  "file" : "a.c"
                  "line" : 3,
                  "noteId" : "noteid"
                }
              ]}'
}

function tellName() {
        printf "V3Test"
}

case "$3" in
    run)
        run
        ;;
    finalize)
        finalize
        ;;
    applicable)
        tellApplicable
        ;;
    name)
        tellName
        ;;
    *)
        tellVersion
        ;;
esac


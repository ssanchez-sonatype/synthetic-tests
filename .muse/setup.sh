#!/usr/bin/env bash

cat <<EOF >a.c
#include <stdio.h>
int f()
{
    void *p = malloc(1);
    void *k = malloc(1);
    return 42;
}
EOF

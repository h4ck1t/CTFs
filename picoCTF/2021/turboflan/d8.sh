#!/bin/bash

V8_DIR=/home/h4ck1t/Desktop/CTFs/picoCTF/2021/turboflan
FLAGS="--allow-natives-syntax \
--trace-turbo \
--trace-opt \
--trace-deopt"

rm turbo*

if [[ $# -gt 1 ]]
then
    for ARG in ${@:2}; do
        FLAGS+=" ${ARG}"
    done
fi

if [[ $1 == "debug" ]]
then
    $V8_DIR/d8 $FLAGS
elif [[ $1 == "release" ]]
then
    $V8_DIR/d8 $FLAGS
elif [[ $1 == "gdbr" ]]
then
    gdb -ex=r -x script.gdb --args $V8_DIR/d8 $FLAGS --
elif [[ $1 == "gdbd" ]]
then
    gdb -ex=r -x script.gdb --args $V8_DIR/d8 $FLAGS --
else
    FLAGS+=" $1"
    $V8_DIR/d8 $FLAGS
fi

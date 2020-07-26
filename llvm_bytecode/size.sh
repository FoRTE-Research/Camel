#! /bin/sh

GCC_DIR=/home/saim/ti/msp430-gcc
GCC_BIN=$GCC_DIR/bin
SIZE=$GCC_BIN/msp430-elf-size

for exe in *.out; do

    echo "binary size for " $exe
    $SIZE $exe

done
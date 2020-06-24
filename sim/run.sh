#! /bin/sh

LLVM_DIR=/home/saim/Desktop/llvm-project/build
LLI=$LLVM_DIR/bin/lli

make clean

for opt in O0 O1 O2 O3; do
    echo "Generating files for " $opt
    make optlvl=$opt benchmark=bc
done

for file in *.bc; do
    echo "Running: " $file
    $LLI $file
done

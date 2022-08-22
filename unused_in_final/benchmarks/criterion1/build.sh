#!/bin/bash -ex

# Build project.
./autogen.sh && ./configure && make -j

# Build fuzz target in $OUT directory.
export FUZZ_TARGET=c1
$CXX $CXXFLAGS ./c1.cc \
    -I $FUZZER_LIB \
    -o $OUT/$FUZZ_TARGET
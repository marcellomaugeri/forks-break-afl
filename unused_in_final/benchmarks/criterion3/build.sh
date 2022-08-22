cd criterion3

export FUZZ_TARGET=c3
$CXX $CXXFLAGS -std=c++11 $SRC/c3.cc $FUZZER_LIB -o $OUT/$FUZZ_TARGET
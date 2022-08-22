cd criterion2

export FUZZ_TARGET=c2
$CXX $CXXFLAGS -std=c++11 $SRC/c2.cc $FUZZER_LIB -o $OUT/$FUZZ_TARGET
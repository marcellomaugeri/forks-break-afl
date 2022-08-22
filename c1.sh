#AFL
./AFL/afl-clang++ forks-break-afl/targets/c1/c1-afl.cc -o ./forks-break-afl/bin/c1/AFL
./AFL/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c1/AFL

#AFLplusplus
./AFLplusplus/afl-clang-lto forks-break-afl/targets/c1/c1-afl.cc -o ./forks-break-afl/bin/c1/AFLplusplus
./AFLplusplus/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c1/AFLplusplus

#Eclipser
gcc forks-break-afl/targets/c1/c1-afl.cc -o ./forks-break-afl/bin/c1/Eclipser
./AFLplusplus/afl-fuzz -i ./forks-break-afl/input -o ./output -M master -Q -- ./forks-break-afl/bin/c1/Eclipser
./AFLplusplus/afl-fuzz -i ./forks-break-afl/input -o ./output -M slave -Q -- ./forks-break-afl/bin/c1/Eclipser
/usr/bin/dotnet ./Eclipser/build/Eclipser.dll -t 30 -i ./forks-break-afl/input -s ./output -o ./output/eclipser -p ./forks-break-afl/bin/c1/AFL --arg pos

#AFLSmart
./aflsmart/afl-clang++ forks-break-afl/targets/c1/c1-afl.cc -o ./forks-break-afl/bin/c1/aflsmart
./aflsmart/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c1/aflsmart

#MOpt-AFL
./MOpt-AFL/MOpt/afl-clang++ forks-break-afl/targets/c1/c1-afl.cc -o ./forks-break-afl/bin/c1/MOpt-AFL
./MOpt-AFL/MOpt/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c1/MOpt-AFL

#afl-rb FairFuzz
./afl-rb/afl-clang++ forks-break-afl/targets/c1/c1-afl.cc -o ./forks-break-afl/bin/c1/afl-rb
./afl-rb/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c1/afl-rb

#lafintel
export AFL_LLVM_LAF_ALL=1
./AFLplusplus/afl-clang++ forks-break-afl/targets/c1/c1-afl.cc -o ./forks-break-afl/bin/c1/lafintel
./AFLplusplus/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c1/lafintel

#AFLFast
./aflfast/afl-clang++ forks-break-afl/targets/c1/c1-afl.cc -o ./forks-break-afl/bin/c1/aflfast
./aflfast/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c1/aflfast

#libfuzzer
clang++ -fsanitize=fuzzer,memory ./forks-break-afl/targets/c1/c1-libfuzzer.cc -o ./forks-break-afl/bin/c1/libfuzzer
./forks-break-afl/bin/c1/libfuzzer

#entropic
clang++ -fsanitize=fuzzer ./forks-break-afl/targets/c1/c1-libfuzzer.cc -o ./forks-break-afl/bin/c1/entropic
./forks-break-afl/bin/c1/entropic -focus_function=entropic

#Honggfuzz
./honggfuzz/hfuzz_cc/hfuzz-clang++ forks-break-afl/targets/c1/c1-afl.cc -o ./forks-break-afl/bin/c1/honggfuzz
./honggfuzz/honggfuzz -i forks-break-afl/input/ -o ./output -s -- ./forks-break-afl/bin/c1/honggfuzz

#aflnwe
cd forks-break-afl/simple_http_server_aflnwe
make clean
make CC=../../aflnwe/afl-clang
cd ../../
./aflnwe/afl-fuzz -i forks-break-afl/experiments_profuzzbench/input_test/ -o ./output -N tcp://127.0.0.1/12913 -- ./forks-break-afl/simple_http_server_aflnwe/server 

#AFLNet
cd forks-break-afl/simple_http_server
make clean
make CC=../../aflnet/afl-clang-fast
cd ../../
./aflnet/afl-fuzz -i forks-break-afl/experiments_profuzzbench/input_test/ -o ./output -N tcp://127.0.0.1/12913 -P HTTP -- ./forks-break-afl/simple_http_server/server 

#StateAFL
cd forks-break-afl/simple_http_server
make clean
make CC=../../stateafl//afl-clang-fast
cd ../../
./stateafl/afl-fuzz -i forks-break-afl/experiments_profuzzbench/input_test/ -o ./output -N tcp://127.0.0.1/12913 -P HTTP -- ./forks-break-afl/simple_http_server/server 
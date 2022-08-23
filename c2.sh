#AFL
./AFL/afl-clang++ forks-break-afl/targets/c2/c2-afl.cc -o ./forks-break-afl/bin/c2/AFL
./AFL/afl-fuzz -i forks-break-afl/input/ -o ./output -t 5000 -- ./forks-break-afl/bin/c2/AFL
pkill -f "./forks-break-afl/bin/c2/AFL"

#AFLplusplus
./AFLplusplus/afl-clang-lto forks-break-afl/targets/c2/c2-afl.cc -o ./forks-break-afl/bin/c2/AFLplusplus
./AFLplusplus/afl-fuzz -i forks-break-afl/input/ -o ./output -t 5000 -- ./forks-break-afl/bin/c2/AFLplusplus
pkill -f "./forks-break-afl/bin/c2/AFLplusplus"


#Eclipser
gcc forks-break-afl/targets/c2/c2-afl.cc -o ./forks-break-afl/bin/c2/Eclipser
./AFLplusplus/afl-fuzz -i ./forks-break-afl/input -o ./output -M master -Q -- ./forks-break-afl/bin/c2/Eclipser
./AFLplusplus/afl-fuzz -i ./forks-break-afl/input -o ./output -M slave -Q -- ./forks-break-afl/bin/c2/Eclipser
/usr/bin/dotnet ./Eclipser/build/Eclipser.dll -t 30 -i ./forks-break-afl/input -s ./output -o ./output/eclipser -p ./forks-break-afl/bin/c2/AFL --arg pos

#AFLSmart
./aflsmart/afl-clang++ forks-break-afl/targets/c2/c2-afl.cc -o ./forks-break-afl/bin/c2/aflsmart
./aflsmart/afl-fuzz -i forks-break-afl/input/ -o ./output -t 5000 -- ./forks-break-afl/bin/c2/aflsmart
pkill -f "./forks-break-afl/bin/c2/aflsmart"

#MOpt-AFL
./MOpt-AFL/MOpt/afl-clang++ forks-break-afl/targets/c2/c2-afl.cc -o ./forks-break-afl/bin/c2/MOpt-AFL
./MOpt-AFL/MOpt/afl-fuzz -i forks-break-afl/input/ -o ./output -t 5000 -- ./forks-break-afl/bin/c2/MOpt-AFL
pkill -f "./forks-break-afl/bin/c2/Mopt-AFL"

#afl-rb FairFuzz
./afl-rb/afl-clang++ forks-break-afl/targets/c2/c2-afl.cc -o ./forks-break-afl/bin/c2/afl-rb
./afl-rb/afl-fuzz -i forks-break-afl/input/ -o ./output -t 5000 -- ./forks-break-afl/bin/c2/afl-rb

#lafintel
export AFL_LLVM_LAF_ALL=1
./AFLplusplus/afl-clang++ forks-break-afl/targets/c2/c2-afl.cc -o ./forks-break-afl/bin/c2/lafintel
./AFLplusplus/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c2/lafintel

#AFLFast
./aflfast/afl-clang++ forks-break-afl/targets/c2/c2-afl.cc -o ./forks-break-afl/bin/c2/aflfast
./aflfast/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c2/aflfast

#libfuzzer
clang++ -fsanitize=address,fuzzer ./forks-break-afl/targets/c2/c2-libfuzzer.cc -o ./forks-break-afl/bin/c2/libfuzzer
./forks-break-afl/bin/c2/libfuzzer -timeout=1

#entropic
clang++ -fsanitize=fuzzer ./forks-break-afl/targets/c2/c2-libfuzzer.cc -o ./forks-break-afl/bin/c2/entropic
./forks-break-afl/bin/c2/entropic -focus_function=entropic

#Honggfuzz
./honggfuzz/hfuzz_cc/hfuzz-clang++ forks-break-afl/targets/c2/c2-honggfuzz.cc -o ./forks-break-afl/bin/c2/honggfuzz
./honggfuzz/honggfuzz -i forks-break-afl/input/ -o ./output -s -- ./forks-break-afl/bin/c2/honggfuzz
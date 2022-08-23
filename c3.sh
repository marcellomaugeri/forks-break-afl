#AFL
./AFL/afl-clang++ forks-break-afl/targets/c3/c3-afl.cc -o ./forks-break-afl/bin/c3/AFL
./AFL/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c3/AFL @@

#AFLplusplus
./AFLplusplus/afl-clang-lto++ forks-break-afl/targets/c3/c3-afl.cc -o ./forks-break-afl/bin/c3/AFLplusplus
./AFLplusplus/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c3/AFLplusplus @@

#Eclipser
g++ forks-break-afl/targets/c3/c3-afl.cc -o ./forks-break-afl/bin/c3/Eclipser
./AFLplusplus/afl-fuzz -i ./forks-break-afl/input -o ./output -M master -Q -- ./forks-break-afl/bin/c3/Eclipser @@
./AFLplusplus/afl-fuzz -i ./forks-break-afl/input -o ./output -M slave -Q -- ./forks-break-afl/bin/c3/Eclipser @@
/usr/bin/dotnet ./Eclipser/build/Eclipser.dll -t 30 -i ./forks-break-afl/input -s ./output -o ./output/eclipser -p ./forks-break-afl/bin/c3/AFL --arg pos

#AFLSmart
./aflsmart/afl-clang++ forks-break-afl/targets/c3/c3-afl.cc -o ./forks-break-afl/bin/c3/aflsmart
./aflsmart/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c3/aflsmart @@

#MOpt-AFL
./MOpt-AFL/MOpt/afl-clang++ forks-break-afl/targets/c3/c3-afl.cc -o ./forks-break-afl/bin/c3/MOpt-AFL
./MOpt-AFL/MOpt/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c3/MOpt-AFL @@

#afl-rb FairFuzz
./afl-rb/afl-clang++ forks-break-afl/targets/c3/c3-afl.cc -o ./forks-break-afl/bin/c3/afl-rb
./afl-rb/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c3/afl-rb @@

#lafintel
export AFL_LLVM_LAF_ALL=1
./AFLplusplus/afl-clang-lto++ forks-break-afl/targets/c3/c3-afl.cc -o ./forks-break-afl/bin/c3/lafintel
./AFLplusplus/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c3/lafintel @@

#AFLFast
./aflfast/afl-clang++ forks-break-afl/targets/c3/c3-afl.cc -o ./forks-break-afl/bin/c3/aflfast
./aflfast/afl-fuzz -i forks-break-afl/input/ -o ./output -- ./forks-break-afl/bin/c3/aflfast @@

#libfuzzer
clang++ -fsanitize=address,fuzzer ./forks-break-afl/targets/c3/c3-libfuzzer.cc -o ./forks-break-afl/bin/c3/libfuzzer
./forks-break-afl/bin/c3/libfuzzer

#entropic
clang++ -fsanitize=fuzzer ./forks-break-afl/targets/c3/c3-libfuzzer.cc -o ./forks-break-afl/bin/c3/entropic
./forks-break-afl/bin/c3/entropic -focus_function=entropic

#Honggfuzz
./honggfuzz/hfuzz_cc/hfuzz-clang++ forks-break-afl/targets/c3/c3-honggfuzz.cc -o ./forks-break-afl/bin/c3/honggfuzz
./honggfuzz/honggfuzz -i forks-break-afl/input/ -o ./output -s -Q -- ./forks-break-afl/bin/c3/honggfuzz @@
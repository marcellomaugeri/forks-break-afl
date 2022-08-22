source .venv/bin/activate
PYTHONPATH=. python3 experiment/run_experiment.py \
--experiment-config fuzzbench-config.yaml \
--benchmarks criterion1 criterion2 criterion3 \
--experiment-name fork-break \
--fuzzers aflplusplus honggfuzz entropic eclipser afl aflsmart mopt libfuzzer fairfuzz lafintel aflfast \
--no-seeds
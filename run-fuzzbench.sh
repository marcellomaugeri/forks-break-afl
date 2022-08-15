source .venv/bin/activate
PYTHONPATH=. python3 experiment/run_experiment.py \
--experiment-config experiment-config.yaml \
--benchmarks c1 c2 c3 \
--experiment-name fork-break \
--fuzzers afl libfuzzer
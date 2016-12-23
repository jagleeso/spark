#!/usr/bin/env bash

echo "$(date) :: HELLO WORLD" > $HOME/executor-env.out
env >> $HOME/executor-env.out

if [[ "$BENCH_ENABLE" = 'yes' ]] && [[ "$BENCH_TARGET" = 'Executor' ]]; then
    CMD=( \
        "amplxe-cl" \
        "-collect" \
        "general-exploration" \
        "$@")
    echo "CMD = ${CMD[@]}" >> $HOME/executor-env.out
    "${CMD[@]}"
elif [[ "$BENCH_STRACE" = 'yes' ]] && [[ "$BENCH_TARGET" = 'Executor' ]]; then
    CMD=( \
        "strace" \
        "-f" \
        "-o" \
        "strace.$(hostname).out" \
        "$@")
    echo "CMD = ${CMD[@]}" >> $HOME/executor-env.out
    "${CMD[@]}"
else
    echo "CMD = $@" >> $HOME/executor-env.out
    "$@"
fi

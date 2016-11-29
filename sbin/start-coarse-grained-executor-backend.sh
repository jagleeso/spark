#!/usr/bin/env bash

env > $HOME/executor-env.out

if [[ "$BENCH_ENABLE" = 'yes' ]] && [[ "$BENCH_TARGET" = 'Executor' ]]; then
    CMD=( \
        "amplxe-cl" \
        "-collect" \
        "general-exploration" \
        "$@")
    "${CMD[@]}"
else
    "$@"
fi

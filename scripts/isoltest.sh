#!/usr/bin/env bash

set -e

BATCHES=4

REPO_ROOT="$(dirname "$0")"/..
for batch in $(seq $BATCHES)
do
    exec "${REPO_ROOT}/build/test/tools/isoltest" \
        --testpath "${REPO_ROOT}/test" \
        --batches "$BATCHES" \
        --selected-batch $((batch - 1)) \
        "$@" &
done
wait

#!/usr/bin/env bash
# Exit on error and error on unbound variable.
set -eu

function usage() {
    if [ -n "$1" ]; then
        echo -e "$1\n";
    fi

    echo "Usage: $0 [--serve] [--port port]";
    echo "  -s, --serve   Start dev server. Build and exit without this.";
    echo "  -p, --port    The port for the dev server. Defaults to 4567";
    echo "";
    echo "Examples:";
    echo "  $0";
    echo "  $0 --serve --port 8888";
    exit 1;
}

PORT=4567
while [[ "$#" > 0 ]]; do case $1 in
    -s|--serve) SERVE="1"; shift;;
    -p|--port) PORT="$2"; shift; shift;;
    *) usage "Unknown parameter: $1"; shift; shift;;
esac; done

if [ -z "${SERVE:-}" ]; then
  echo "Building...";
  docker run \
    --rm \
    -v $(pwd)/build:/srv/slate/build \
    -v $(pwd)/source:/srv/slate/source \
    slatedocs/slate:v2.9.2
else
  echo "Starting dev server...";
  docker run \
    --rm \
    -v $(pwd)/build:/srv/slate/build \
    -v $(pwd)/source:/srv/slate/source \
    -p $PORT:4567 \
    slatedocs/slate:v2.9.2 \
    serve
fi

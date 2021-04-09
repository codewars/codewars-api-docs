#!/bin/sh

docker run \
    --rm \
    -v $(pwd)/build:/srv/slate/build \
    -v $(pwd)/source:/srv/slate/source \
    slatedocs/slate:v2.9.2

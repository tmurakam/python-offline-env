#!/bin/sh

download() {
    variant=$1
    tag=python-offline-env-$variant
    
    docker build -t $tag -f docker/Dockerfile.$variant . || exit 1

    docker container run -it --rm -v $PWD:/src $tag /bin/bash -c "cd /src && ./download.sh" || exit 1
}


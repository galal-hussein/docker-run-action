#!/usr/bin/env bash

if [ ! -z $INPUT_USERNAME ];
then echo $INPUT_PASSWORD | docker login $INPUT_REGISTRY -u $INPUT_USERNAME --password-stdin
fi

if [ ! -z $INPUT_DOCKER_NETWORK ];
then INPUT_OPTIONS="$INPUT_OPTIONS --network $INPUT_DOCKER_NETWORK"
fi

if [ ! -z $INPUT_ENTRYPOINT ]; then 
    INPUT_ENTRYPOINT="--entrypoint=$INPUT_ENTRYPOINT"
fi

exec docker run -v "/var/run/docker.sock":"/var/run/docker.sock" $INPUT_OPTIONS $INPUT_ENTRYPOINT $INPUT_IMAGE "${INPUT_RUN//$'\n'/;}"

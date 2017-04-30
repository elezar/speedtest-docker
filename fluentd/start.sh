#!/bin/bash

if [ -e .env ]
then
source .env
fi

FLUENTD_HTTP_ENDPOINT=${FLUENTD_HTTP_ENDPOINT:-http://www.example.com}

IMAGE_NAME=local-fluent


TIME_VOLUMES=
if [ -e /etc/localtime ]
then
    TIME_VOLUMES="${TIME_VOLUMES} -v /etc/localtime:/etc/localtime:ro"
fi

docker run --rm -ti \
        -e FLUENTD_OPT="-v" \
        -e FLUENTD_HTTP_ENDPOINT=${FLUENTD_HTTP_ENDPOINT} \
        ${TIME_VOLUMES} \
        -p 24224:24224 \
        ${IMAGE_NAME}

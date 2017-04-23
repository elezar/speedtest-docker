#!/bin/bash

IMAGE_NAME=bq-fluent
# IMAGE_NAME=fluent/fluentd:latest

docker run --rm -ti \
        -v $(pwd)/fluentd/config:/fluentd/etc \
        -e FLUENTD_CONF=docker.conf \
        -e FLUENTD_OPT="-v" \
        -e HOST_ID=$(hostname) \
        -e HOST_ZONE="home" \
        -v $(pwd)/.secrets:/.secrets:ro \
        -e GOOGLE_APPLICATION_CREDENTIALS=/.secrets/speedtest-1f97167915fa.json \
        -p 24224:24224 \
        ${IMAGE_NAME}

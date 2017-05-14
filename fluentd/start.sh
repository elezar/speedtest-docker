#!/bin/bash

if [ -e .env ]
then
source .env
fi

FLUENTD_HTTP_ENDPOINT=${FLUENTD_HTTP_ENDPOINT:-http://www.example.com}
SPEEDTEST_LOG_PATH=${SPEEDTEST_LOG_PATH:-/tmp}

IMAGE_NAME=fluentd-logger
if [ ! -d ${SPEEDTEST_LOG_PATH} ]
then
  mkdir -p ${SPEEDTEST_LOG_PATH}
fi

TIME_VOLUMES=
if [ -e /etc/localtime ]
then
    TIME_VOLUMES="${TIME_VOLUMES} -v /etc/localtime:/etc/localtime:ro"
fi

docker run --restart=always --name=fluentdapp -d \
        -e FLUENTD_OPT="-v" \
        -e SPEEDTEST_LOG_PATH=${SPEEDTEST_LOG_PATH} \
        -e FLUENTD_HTTP_ENDPOINT=${FLUENTD_HTTP_ENDPOINT} \
        -v ${SPEEDTEST_LOG_PATH}:/output_logs \
        ${TIME_VOLUMES} \
        -p 24224:24224 \
        ${IMAGE_NAME}

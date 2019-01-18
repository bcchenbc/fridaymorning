#!/usr/bin/env sh
export FRIMORN_SERVICE_NAME=webservice
export FRIMORN_IMAGE_NAME=webservice
export FRIMORN_REGISTRY="localhost:5000"
#FRIMORN_IMAGE_TAG=$(git log | head -1 | awk '{print $2}' | awk '{print substr ($0, 0, 8)}')
export FRIMORN_IMAGE_TAG=$(date -u +"%m%dT%H%M")

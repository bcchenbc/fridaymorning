#!/usr/bin/env sh
source settings.sh
echo "Deploying image \"$FRIMORN_IMAGE_NAME:$FRIMORN_IMAGE_TAG\" to service $FRIMORN_SERVICE_NAME."
docker service update webservice_canaryset0 --image $FRIMORN_REGISTRY/$FRIMORN_IMAGE_NAME/$FRIMORN_IMAGE_NAME:$FRIMORN_IMAGE_TAG

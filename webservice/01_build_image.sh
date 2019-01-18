#!/usr/bin/env sh
source settings.sh
echo "Working on image \"$FRIMORN_IMAGE_NAME:$FRIMORN_IMAGE_TAG\" in $(pwd)."
docker login $FRIMORN_REGISTRY -u frimorn -p password
docker build -t $FRIMORN_IMAGE_NAME:$FRIMORN_IMAGE_TAG .
docker tag $FRIMORN_IMAGE_NAME:$FRIMORN_IMAGE_TAG $FRIMORN_REGISTRY/$FRIMORN_IMAGE_NAME/$FRIMORN_IMAGE_NAME:$FRIMORN_IMAGE_TAG
docker push $FRIMORN_REGISTRY/$FRIMORN_IMAGE_NAME/$FRIMORN_IMAGE_NAME:$FRIMORN_IMAGE_TAG

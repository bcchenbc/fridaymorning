#!/usr/bin/env sh
source settings.sh
docker stack deploy -c canaryset.yml $FRIMORN_SERVICE_NAME

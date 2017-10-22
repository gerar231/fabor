#!/bin/bash

set -e


REGISTRY=faborimages.azurecr.io
NAME=website
TAG=$(git rev-parse --short HEAD)
TAGGED_IMAGE=$REGISTRY/$NAME:$TAG



docker login faborimages.azurecr.io \
            -u faborimages \
            -p iRrUvXnQEqccPGztvW=hBmEFv9SfBefL

docker build -t $NAME .

docker tag $NAME $TAGGED_IMAGE

echo "Pushing $TAGGED_IMAGE"

docker push $TAGGED_IMAGE

echo "Success"

az container delete -g fabor-services \
                         --name $NAME \
                         --yes

az container create -g fabor-services \
                         --name $NAME \
                         --image $TAGGED_IMAGE \
                         --cpu 1 \
                         --memory 1 \
                         --ip-address public \
                         --port 80 \
                         --registry-password iRrUvXnQEqccPGztvW=hBmEFv9SfBefL




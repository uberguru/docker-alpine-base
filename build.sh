#!/bin/bash

DOCKER_USER=$1
DOCKER_PASS=$2
COMMIT=$3
TAG=latest

echo "building"
docker login -u $DOCKER_USER -p $DOCKER_PASS
export REPO=uberguru/alpine
#export TAG=`if [ "$TRAVIS_BRANCH" == "master" ]; then echo "latest"; else echo $TRAVIS_BRANCH ; fi`
docker build -f Dockerfile -t "$REPO:$COMMIT" .
docker tag $REPO:$COMMIT $REPO:$TAG
#docker tag $REPO:$COMMIT $REPO:travis-$TRAVIS_BUILD_NUMBER
docker push $REPO:$TAG

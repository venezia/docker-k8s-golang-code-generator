#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

THIS_DIRECTORY=$(dirname "${BASH_SOURCE}")

PROJECT_DIRECTORY=${THIS_DIRECTORY}

K8S_DESTINATION_LOCATION_API=${PROJECT_DIRECTORY}/pkg/generated/k8s

DOCKER_ARGUMENTS="run --rm=true --entrypoint /bin/bash -it -v ${PWD}:/go/src/github.com/venezia/sillyproject -w /go/src/github.com/sillyproject"
DOCKER_IMAGE=quay.io/venezia/k8s-golang-code-generator:1.24.1

echo "Ensuring API Destination Directory ( ${K8S_DESTINATION_LOCATION_API} ) Exists..."
mkdir -p ${K8S_DESTINATION_LOCATION_API}

echo docker $DOCKER_ARGUMENTS $DOCKER_IMAGE \
       /go/code-generator/generate-groups.sh \
       "deepcopy,client,informer,lister" \
       github.com/venezia/sillyproject/pkg/generated/k8s \
       github.com/venezia/sillyproject/api/example-com \
       sillyproject:v1alpha1 \
       --output-base "/go/src" \
       --go-header-file assets/k8s/boilerplate.txt

docker $DOCKER_ARGUMENTS $DOCKER_IMAGE \
       /go/code-generator/generate-groups.sh \
       "deepcopy,client,informer,lister" \
       github.com/venezia/sillyproject/pkg/generated/k8s \
       github.com/venezia/sillyproject/api/example-com \
       sillyproject:v1alpha1 \
       --output-base "/go/src" \
       --go-header-file assets/k8s/boilerplate.txt



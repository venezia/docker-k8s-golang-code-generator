FROM golang:1.20.5-alpine3.18
#FROM quay.io/venezia/golang:1.20.5-alpine3.18
ARG CODEGEN_TAG=kubernetes-1.27.3

RUN apk update && apk add git bash
RUN git clone https://github.com/kubernetes/code-generator.git
WORKDIR /go/code-generator
RUN    git checkout ${CODEGEN_TAG}
# induce the golang libraries to be pulled in for faster runtime work
RUN    bash /go/code-generator/generate-groups.sh foo bar foo foo

ENTRYPOINT /bin/bash

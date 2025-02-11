FROM golang:1.23.6-alpine3.20
ARG CODEGEN_TAG=kubernetes-1.32.1

RUN apk update && apk add git bash openssh && \
  go install k8s.io/code-generator/cmd/applyconfiguration-gen@${CODEGEN_TAG} && \
  go install k8s.io/code-generator/cmd/conversion-gen@${CODEGEN_TAG} && \
  go install k8s.io/code-generator/cmd/defaulter-gen@${CODEGEN_TAG} && \
  go install k8s.io/code-generator/cmd/informer-gen@${CODEGEN_TAG} && \
  go install k8s.io/code-generator/cmd/prerelease-lifecycle-gen@${CODEGEN_TAG} && \
  go install k8s.io/code-generator/cmd/client-gen@${CODEGEN_TAG} && \
  go install k8s.io/code-generator/cmd/deepcopy-gen@${CODEGEN_TAG} && \
  go install k8s.io/code-generator/cmd/go-to-protobuf@${CODEGEN_TAG} && \
  go install k8s.io/code-generator/cmd/lister-gen@${CODEGEN_TAG} && \
  go install k8s.io/code-generator/cmd/register-gen@${CODEGEN_TAG}

ENTRYPOINT /bin/bash

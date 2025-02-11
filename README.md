# Docker Container for kubernetes api code generation for the go programming language

This is a somewhat helper program to make code generation a bit more repeatable

## Usage

More to come...

```
client-gen -v 9 --go-header-file boilerplate.txt \
  --output-dir pkg/generated/k8s/michaelvenezia/clientset \
  --output-pkg sample-app/pkg/generated/k8s/michaelvenezia/clientset  \
  --clientset-name versioned \
  --input /bario/api/k8s/venezia-k8s-go/demo/v1alpha1 --input-base ''

lister-gen -v 9 --go-header-file boilerplate.txt \
  --output-dir pkg/generated/k8s/michaelvenezia/listers \
  --output-pkg sample-app/pkg/generated/k8s/michaelvenezia/listers  \
  /bario/api/k8s/venezia-k8s-go/demo/v1alpha1

informer-gen -v 9 --go-header-file boilerplate.txt \
  --output-dir pkg/generated/k8s/michaelvenezia/informers \
  --output-pkg sample-app/pkg/generated/k8s/michaelvenezia/informers  \
  --versioned-clientset-package sample-app/pkg/generated/k8s/michaelvenezia/clientset/versioned \
  --listers-package sample-app/pkg/generated/k8s/michaelvenezia/listers \
  /bario/api/k8s/venezia-k8s-go/demo/v1alpha1
```


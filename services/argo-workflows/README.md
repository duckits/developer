# Argo Workflows

Argo Workflows - The workflow engine for Kubernetes

## references

[Argo Workflows Documentation](https://argoproj.github.io/argo-workflows/)

## Usage

1. Get Argo Server external IP/domain by running:

kubectl --namespace argo-workflows get services -o wide | grep argo-workflows-server

2. Submit the hello-world workflow by running:

argo submit https://raw.githubusercontent.com/argoproj/argo-workflows/master/examples/hello-world.yaml --watch

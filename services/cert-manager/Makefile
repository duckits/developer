
export CHART = cert-manager
export MODULE = .
export NAMESPACE = cert-manager
export REPO = jetstack
export URL = https://charts.jetstack.io
export VERSION = 1.8.2

include ../Makefile

preinstall:
	kubectl apply --filename=$(MODULE)/cert-manager.crds.yaml

postinstall:
	kubectl apply --filename=$(MODULE)/cluster-issuer.yaml
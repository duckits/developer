
export CHART = jupyterhub
export MODULE = .
export NAMESPACE = jupyterhub
export REPO = jupyterhub
export URL = https://jupyterhub.github.io/helm-chart/
export VERSION = 1.2.0

include ../Makefile

preinstall:
	-kubectl create ns $(NAMESPACE)
	kubectl apply -f pv.yaml --namespace $(NAMESPACE)
_PHONY: preinstall

postinstall:
	-kubectl get secret minio --namespace=minio -o yaml | sed 's/namespace: .*/namespace: jupyterhub/' | kubectl apply -f -
	-kubectl get secret postgresql --namespace=postgresql -o yaml | sed 's/namespace: .*/namespace: jupyterhub/' | kubectl apply -f -
	kubectl create secret generic oanda --namespace $(NAMESPACE) \
  	--from-literal=api-key=$(OANDA_API_KEY)
_PHONY: postinstall

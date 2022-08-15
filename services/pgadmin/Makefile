
export CHART = pgadmin4
export MODULE = .
export NAMESPACE = pgadmin
export REPO = runix
export URL = https://helm.runix.net
export VERSION = 1.11.0

include ../Makefile

preinstall:
	-kubectl create ns $(NAMESPACE)
	-kubectl create configmap opsbots-tls-ca \
		--from-file=opsbot.pem=$(HOME)/.certs/cacert.pem \
		--namespace $(NAMESPACE)
	kubectl apply -f configmap.yaml --namespace $(NAMESPACE)
_PHONY: preinstall

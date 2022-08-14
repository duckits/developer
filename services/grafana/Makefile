
export CHART = grafana
export MODULE = .
export NAMESPACE = grafana
export REPO = grafana
export URL = https://grafana.github.io/helm-charts
export VERSION = 6.32.2

include ../Makefile

preinstall:
	kubectl create ns $(NAMESPACE)
	kubectl create configmap opsbots-tls-ca \
				--from-file=opsbot.pem=$(HOME)/.certs/cacert.pem \
				--namespace $(NAMESPACE)
_PHONY: preinstall

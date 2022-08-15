
export CHART = postgresql
export MODULE = .
export NAMESPACE = postgresql
export REPO = bitnami
export URL = https://charts.bitnami.com/bitnami
export VERSION = 11.6.7

include ../Makefile

preinstall:
	-kubectl create namespace $(NAMESPACE)
	-kubectl create configmap postgresql-init \
		--from-file=seed.sql=seed.sql \
		--namespace=$(NAMESPACE)
	kubectl create secret generic postgresql \
		--from-literal=postgres-password=$(POSTGRES_PASSWORD) \
		--namespace=$(NAMESPACE)
_PHONY: preinstall



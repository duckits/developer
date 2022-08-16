
export CHART = timescaledb-single
export MODULE = .
export NAMESPACE = timescaledb
export REPO = timescaledb
export URL = https://raw.githubusercontent.com/timescale/timescaledb-kubernetes/master/charts/repo/
export VERSION = 0.13.1

include ../Makefile

preinstall:
	-kubectl create namespace $(NAMESPACE)
	-kubectl create configmap postgresql-init \
		--from-file=seed.sql=seed.sql \
		--namespace=$(NAMESPACE)
	kubectl create secret generic timescaledb-single-credentials \
		--from-literal=PATRONI_REPLICATION_PASSWORD=$(POSTGRES_PASSWORD) \
		--from-literal=PATRONI_SUPERUSER_PASSWORD=$(POSTGRES_PASSWORD) \
		--from-literal=PATRONI_admin_PASSWORD=$(POSTGRES_PASSWORD) \
		--namespace=$(NAMESPACE)
_PHONY: preinstall

export PROJECT_ROOT ?= $(shell git rev-parse --show-toplevel)

-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/opsbot/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

.DEFAULT_GOAL :=

REPO_PATH ?= ./src

## initialize project and load dependencies
bootstrap: init brew direnv manifest cluster
.PHONY: bootstrap

## configure and create kubernetes cluster
cluster:
	./bin/cluster create
.PHONY: cluster

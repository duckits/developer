export K8S_CTX ?= $(shell kubectl config current-context)

.DEFAULT_GOAL := bootstrap

bootstrap: deps search values pull
_PHONY: bootstrap

deploy: deps preinstall install postinstall
_PHONY: deploy

deployall:
_PHONY: deployall

delete:
	helm delete $(CHART) --namespace $(NAMESPACE)
_PHONY: delete

deps:
	helm repo add $(REPO) $(URL)
_PHONY: deps

destroy: predelete delete postdelete
_PHONY: destroy

destroyall:
_PHONY: destroyall

fetch:
	helm fetch $(REPO)/$(CHART) --version $(VERSION)
_PHONY: fetch

install:
	helm upgrade $(CHART) $(REPO)/$(CHART) \
		--cleanup-on-fail \
		--create-namespace \
		--debug \
		--install \
		--namespace $(NAMESPACE) \
		--timeout 10m \
		--values $(MODULE)/overrides.yaml \
		--version $(VERSION)
_PHONY: install

manifest:
	helm template \
		--values $(MODULE)/overrides.yaml \
		$(REPO)/$(CHART) \
		--set Release.Name=$(CHART) \
		> $(MODULE)/$(CHART)-$(VERSION).yaml
_PHONY: manifest

# override this action in your package as needed
preinstall:
_PHONY: preinstall

# override this action in your package as needed
predelete:
_PHONY: predelete

# override this action in your package as needed
postinstall:
_PHONY: postinstall

# override this action in your package as needed
postdelete:
_PHONY: postdelete

pull:
	helm pull $(REPO)/$(CHART) \
		--untar \
		--untardir .chart \
		--version $(VERSION)
_PHONY: pull

search:
	helm search repo $(CHART)
_PHONY: search

uninstall:
	helm uninstall $(CHART) --namespace $(NAMESPACE)
_PHONY: search

values:
	helm inspect values $(REPO)/$(CHART) \
		--version $(VERSION) \
		> $(MODULE)/$(CHART)-$(VERSION)-values.yaml
	touch $(MODULE)/overrides.yaml
_PHONY: values

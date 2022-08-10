
export CHART = kubernetes-dashboard
export MODULE = .
export NAMESPACE = kubernetes-dashboard
export REPO = kubernetes-dashboard
export URL = https://kubernetes.github.io/dashboard/
export VERSION = 5.7.0

include ../Makefile

postinstall:
	kubectl apply --filename=$(MODULE)/sa-cluster-admin.yaml

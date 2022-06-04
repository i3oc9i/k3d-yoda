SHELL := /bin/bash

KLUSTER_ID  = yoda
REGISTRY_ID = registry-yoda.local:5000

all: help

k3d-setup:
	k3d cluster create $(KLUSTER_ID) --config ./k3d/config.yaml
	kubectl cluster-info
	kubectl get node -o wide

k3d-start:
	k3d cluster start $(KLUSTER_ID) 

k3d-stop:
	k3d cluster stop $(KLUSTER_ID) 

k3d-destroy:
	k3d cluster delete $(KLUSTER_ID) 

# ------------------------------------------------------------------- Help
help:
	@echo "make k3d-create     - create the playground k3d kluster and the registry."
	@echo "make k3d-destroy    - destroy the playground k3d kluster and the registry.

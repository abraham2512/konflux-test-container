REG_URL ?= quay.io/$(USER)
IMAGE_NAME ?= konflux-test-container
IMAGE_URL ?= $(REG_URL)/$(IMAGE_NAME)
VERSION ?= latest

.PHONY: help build

help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

build: ## Build the container image
	podman build -t ${IMAGE_NAME}:${VERSION} -f Containerfile .


.DEFAULT_GOAL := help

build: ## Build the library executable. Example: make build
	go build -mod vendor
.PHONY: build

test: ## Run the unit tests. Example: make test
	go test
.PHONY: test

vendor: ## Vendor the program dependencies. Example: make vendor
	go mod vendor
.PHONY: vendor

verify: ## Run core verification. Example: make verify
	go run -mod vendor main.go verify
	hack/verify-yaml.sh
	hack/verify-pullrequest.sh
.PHONY: verify

import: ## Run the import script. Example: make import
	go run -mod vendor main.go import
.PHONY: import

help: ## [Default Target] - Print this help. Example: make help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
.PHONY: help


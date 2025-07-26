# Makefile for Terraform environments

# Default environment
ENV ?= dev
DIR := environments/$(ENV)

# Terraform binary
TERRAFORM := terraform

# Colors for output
GREEN=\033[0;32m
RESET=\033[0m

.PHONY: init plan apply destroy validate fmt lint docs

help:
	@echo ""
	@echo "$(GREEN)Available commands:$(RESET)"
	@echo "  make init ENV=dev      - Initialize Terraform in selected environment"
	@echo "  make plan ENV=dev      - Plan changes"
	@echo "  make apply ENV=dev     - Apply changes"
	@echo "  make destroy ENV=dev   - Destroy environment"
	@echo "  make validate ENV=dev  - Validate Terraform config"
	@echo "  make fmt               - Format Terraform code"
	@echo "  make lint              - Run tflint"
	@echo "  make docs              - Generate documentation with terraform-docs"

init:
	cd $(DIR) && $(TERRAFORM) init

plan:
	cd $(DIR) && $(TERRAFORM) plan -out=tfplan

apply:
	cd $(DIR) && $(TERRAFORM) apply -auto-approve tfplan

destroy:
	cd $(DIR) && $(TERRAFORM) destroy -auto-approve

validate:
	cd $(DIR) && $(TERRAFORM) validate

fmt:
	@echo "Running terraform fmt..."
	$(TERRAFORM) fmt -recursive

lint:
	@echo "Running tflint..."
	tflint --recursive

docs:
	@echo "Generating docs..."
	terraform-docs markdown table . > README.md

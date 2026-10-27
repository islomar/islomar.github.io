.PHONY: help install-without-docker build up up-with-drafts down shell time

DOCKER_IMAGE_NAME := blog-islomar
JEKYLL_SERVE := bundle exec jekyll serve --host 0.0.0.0 --livereload --force_polling
DOCKER_RUN_BLOG := docker run --rm --name "$(DOCKER_IMAGE_NAME)" --user "$$(id -u):$$(id -g)" --env HOME=/tmp --volume="$(PWD):/srv/jekyll" -p 4000:4000 -p 35729:35729 -it $(DOCKER_IMAGE_NAME)

default: help

help: ## Print this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

deps: ## Install dependencies locally
	bundle install

install-without-docker: ## Install blog locally without Docker
	./install-blog-locally.sh

run-without-docker: ## Run blog locally without Docker
	bundle exec jekyll serve --livereload

run-without-docker-with-drafts: ## Run blog locally without Docker but with drafts
	bundle exec jekyll serve --livereload --drafts

build: ## Build the Docker image with the blog dependencies
	docker build -t $(DOCKER_IMAGE_NAME) .

up: down build ## Start locally using Docker
	$(DOCKER_RUN_BLOG) $(JEKYLL_SERVE)

up-with-drafts: down build ## Start locally using Docker including drafts
	$(DOCKER_RUN_BLOG) $(JEKYLL_SERVE) --drafts

down: ## Stop and remove local Docker blog
	docker rm -f $(DOCKER_IMAGE_NAME) 2>/dev/null || true

shell: ## Open a shell in the Docker container
	$(DOCKER_RUN_BLOG) bash

time: ## Get the timestamp to be added to each post header
	date --iso-8601=seconds
.PHONY: help install-without-docker up up-with-drafts down time

DOCKER_IMAGE_NAME := blog-islomar
## https://pages.github.com/versions/
JEKYLL_VERSION := 3 
DOCKER_RUN_BLOG := docker run --name "$(DOCKER_IMAGE_NAME)" --volume="$(PWD):/srv/jekyll" -p 4000:4000 -p 35729:35729 -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll serve --watch --livereload --verbose

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

up: down ## Start locally using Docker
	$(DOCKER_RUN_BLOG)

up-with-drafts: down ## Start locally using Docker including drafts
	$(DOCKER_RUN_BLOG) --drafts

down: ## Stop and remove local Docker blog
	docker rm -f $(DOCKER_IMAGE_NAME)

shell: ## Open a shell in the Docker container
	docker run -it jekyll/jekyll:$(JEKYLL_VERSION) sh	

time: ## Get the timestamp to be added to each post header
	date --iso-8601=seconds
.PHONY: help install-without-docker up up-with-drafts down time

JEKYLL_VERSION := 4.1.0
DOCKER_RUN_BLOG := docker run --name blog-islomar --volume="$(PWD):/srv/jekyll" -p 4000:4000 -p 35729:35729 -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll serve --watch --livereload --verbose

default: help

help: ## Print this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install-without-docker: ## Install blog locally without Docker
	./install-blog-locally.sh

run-without-docker: ## Run blog locally without Docker
	bundle exec jekyll serve --livereload

up: down ## Start locally using Docker
	$(DOCKER_RUN_BLOG)

up-with-drafts: ## Start locally using Docker including drafts
	$(DOCKER_RUN_BLOG) --drafts

down: ## Stop and remove local Docker blog
	docker rm -f blog-islomar

time: ## Get the timestamp to be added to each post header
	date --iso-8601=seconds
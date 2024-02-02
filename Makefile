.PHONY: help deps up docker-up time

JEKYLL_VERSION := 4.1.0

default: help

help: ## Print this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

up: ## Start locally using Docker
	docker run --name blog-islomar --volume="$(PWD):/srv/jekyll" -p 4000:4000 -p 35729:35729 -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll serve --watch --livereload --verbose

up-with-drafts: ## Start locally using Docker including drafts
	docker run --name blog-islomar --volume="$(PWD):/srv/jekyll" -p 4000:4000 -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll serve --watch --livereload --verbose --drafts

down: ## Stop local Docker containers
	docker rm -f blog-islomar

time: ## Get the timestamp to be added to each post header
	date --iso-8601=seconds
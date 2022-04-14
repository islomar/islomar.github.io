.PHONY: help deps up docker-up time

default: help

help: ## Print this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

deps: ## Install dependencies locallly
	bundle install

up: ## Start locally the jekyll server (it requires deps)
	bundle exec jekyll serve --livereload

docker-up: ## Start locally using Docker
	docker-compose up

time: ## Get the timestamp to be added to each post header
	date --iso-8601=seconds
.PHONY: deps up time

deps:
	bundle install

up:
	bundle exec jekyll serve --livereload

docker-up:
	docker-compose up

# Get the timestamp to be added to each post header
time:
	date --iso-8601=seconds
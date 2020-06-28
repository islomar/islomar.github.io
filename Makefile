.PHONY: deps up

deps:
	bundle install

up:
	bundle exec jekyll serve --livereload

docker-up:
	docker-compose up
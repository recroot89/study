bundler:
	docker-compose run --rm ruby bash -c 'gem install bundler'

setup:
	docker-compose run --rm ruby bash -c 'bundle install'

bash:
	docker-compose run --rm ruby bash

lint:
	docker-compose run --rm ruby bash -c 'bundle exec rubocop'

fix:
	docker-compose run --rm ruby bash -c 'bundle exec rubocop --auto-correct'

test:
	docker-compose run --rm ruby bash -c 'bundle exec rake test'

.PHONY: test

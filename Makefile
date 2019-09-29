lint:
	bundle exec rubocop

fix:
	bundle exec rubocop --auto-correct

test:
	bundle exec rake test

.PHONY: test

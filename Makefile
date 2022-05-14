MYSQL_PASSWORD=$(shell cat .env | grep MYSQL_PASSWORD | awk -F"=" {'print $$2'})
MYSQL_HOST=$(shell cat .env | grep MYSQL_HOST | awk -F"=" {'print $$2'})

.PHONY: all test-db-setup rebuild test

all: test-db-setup rebuild test

test-db-setup:
	mysql -u root -p$(MYSQL_PASSWORD) -h$(MYSQL_HOST) -P 3306 -e "create database if not exists library_test;"
	mysql -u root -p$(MYSQL_PASSWORD) -h$(MYSQL_HOST) -P 3306 -e "grant all on library_development.* to root; grant all on library_test.* to root; "

rebuild:
	RAILS_ENV=test bundle exec rails db:migrate:reset

test:
	RAILS_ENV=test bundle exec rspec

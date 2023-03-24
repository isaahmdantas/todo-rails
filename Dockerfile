FROM ruby:3.1.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs cron

WORKDIR /var/www/todo-rails
COPY Gemfile /var/www/todo-rails/Gemfile
COPY Gemfile.lock /var/www/todo-rails/Gemfile.lock

RUN bundle install

COPY . .
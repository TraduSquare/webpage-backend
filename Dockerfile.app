FROM ruby:3.3.1-alpine

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN apk update && apk add --no-cache build-base ruby-dev postgresql-dev
RUN bundle install
EXPOSE 2300

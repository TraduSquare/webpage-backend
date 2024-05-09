ENV RUBY_VERSION=3.3.1

FROM ruby:${RUBY_VERSION}-alpine

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN apk update && apk add --no-cache build-base ruby-dev postgresql-dev
RUN bundle install
EXPOSE 2300

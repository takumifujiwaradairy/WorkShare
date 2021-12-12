FROM ruby:2.7.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /WorkShare
WORKDIR /WorkShare

COPY Gemfile /WorkShare/Gemfile
COPY Gemfile.lock /WorkShare/Gemfile.lock

RUN bundle install
COPY . /WorkShare

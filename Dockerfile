FROM amd64/ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && bundle config set force_ruby_platform true

RUN mkdir /myapp

WORKDIR /myapp

ADD ./Gemfile Gemfile

ADD ./Gemfile.lock Gemfile.lock

RUN brew install yarn 

RUN rails webpacker:install

RUN bundle install

COPY . /myapp
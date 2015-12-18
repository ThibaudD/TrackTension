# Dockerfile

FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /TrackTension
WORKDIR /TrackTension

COPY Gemfile /TrackTension/Gemfile
COPY Gemfile.lock /TrackTension/Gemfile.lock
RUN bundle install

ADD . /TrackTension

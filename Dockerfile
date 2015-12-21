# Dockerfile

FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
ENV PHANTOMJS_VERSION 1.9.8
RUN \
  wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
  rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  mkdir /phantomjs && \
  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /phantomjs/ && \
  ln -s /phantomjs/phantomjs /usr/bin/phantomjs

RUN mkdir /TrackTension
WORKDIR /TrackTension

COPY Gemfile /TrackTension/Gemfile
COPY Gemfile.lock /TrackTension/Gemfile.lock
RUN bundle install

ADD . /TrackTension

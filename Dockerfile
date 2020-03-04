FROM ruby:2.5.7

ARG BUNDLE_GITHUB__COM
ARG BUILD_PACKAGES="build-essential wget git nodejs"
ARG DEV_PACKAGES="libpq-dev"
ARG RUBY_PACKAGES="tzdata"

RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends $BUILD_PACKAGES $DEV_PACKAGES $RUBY_PACKAGES && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  gem install bundler -v '1.17.3'

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

ENV APP_HOME /taxes-for-charity
ENV PATH=$APP_HOME/bin:$PATH

WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

#RUN bundle install -j4 --retry 3

ADD . $APP_HOME

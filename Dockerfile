FROM ruby:2.5

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

COPY src/Gemfile Gemfile
COPY src/package.json package.json

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs \
        && npm install -g yarn \
        && gem install bundler \
        && bundle install

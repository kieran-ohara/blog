FROM ruby:2.5

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs \
        && npm install -g yarn \
        && gem install bundler \
        && mkdir -p /app

WORKDIR /app

COPY src/Gemfile Gemfile
RUN bundle install

COPY . .
RUN jekyll build --config src/_config.yml,_config.yml

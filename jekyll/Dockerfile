FROM ruby:2.5.8

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV JEKYLL_ENV=production

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
        && apt-get install -y nodejs \
        && gem install bundler \
        && mkdir -p /app

WORKDIR /app

COPY src/Gemfile Gemfile
COPY src/Gemfile.lock Gemfile.lock
RUN bundle install

COPY src/package.json package.json
COPY src/package-lock.json package-lock.json
RUN npm install
RUN mkdir -p ./_assets && mv node_modules ./_assets/yarn

COPY src .

RUN rm -rf .jekyll-cache || true \
        && bundle exec jekyll build -V --trace --config _config.yml,_config.override.yml #

FROM nginx:alpine

COPY --from=0 /app/_site /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

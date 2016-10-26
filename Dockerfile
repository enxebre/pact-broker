FROM ruby:2.3.1-alpine

# https://github.com/bethesque/pact_broker/issues/57
RUN gem uninstall -i /usr/local/lib/ruby/gems/2.3.0 bundler
RUN gem install bundler --version 1.12.0

RUN apk --update add \
  build-base \
  ruby-dev \
  sqlite-dev

RUN mkdir /usr/app
WORKDIR /usr/app
COPY . /usr/app/

RUN bundle install
CMD bundle exec rackup -o 0.0.0.0
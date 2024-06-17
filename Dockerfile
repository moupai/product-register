FROM ruby:2.5

# RubyGemsのアップグレード (Ruby 2.5.9の場合)
RUN gem update --system 3.3.22

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn

WORKDIR /product-register
COPY Gemfile Gemfile.lock /product-register/

# 不要なプラットフォームを除外
RUN bundle lock --add-platform ruby
RUN bundle install
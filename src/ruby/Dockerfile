FROM ruby:3.4.2

WORKDIR /home/

COPY ./Gemfile /home/

# vendor/bundleに依存関係をインストールするよう設定する
RUN bundle config set --local path 'vendor/bundle' && \
    bundle install

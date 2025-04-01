FROM ruby:3.4.2

WORKDIR /SQL_study/ruby_pg_study/

COPY ./Gemfile /SQL_study/ruby_pg_study/

# vendor/bundleに依存関係をインストールするよう設定する
RUN bundle config set --local path 'vendor/bundle' && \
    bundle install

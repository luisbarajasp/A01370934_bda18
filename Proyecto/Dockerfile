FROM ruby:2.5-alpine
ENV RUNTIME_PACKAGES libcurl
RUN apk update && apk add build-base nodejs postgresql-dev curl

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install 

COPY . .

LABEL maintainer="Luis Barajas <A01370934@itesm.mx>"

CMD puma -C config/puma.rb


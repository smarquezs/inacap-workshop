FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# RUN mkdir /myapp

WORKDIR /tmp
ADD Gemfile /tmp/Gemfile
ADD Gemfile.lock /tmp/Gemfile.lock
RUN bundle install

RUN mkdir -p /home/app/webapp
COPY . /home/app/webapp
RUN useradd app
RUN chown -R app:app /home/app/webapp

WORKDIR /home/app/webapp

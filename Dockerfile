FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs mariadb-client yarn chromium-driver fonts-ipafont fonts-ipafont-gothic fonts-ipafont-mincho
RUN mkdir /workdir
WORKDIR /workdir
ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD . /workdir

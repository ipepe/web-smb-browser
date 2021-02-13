FROM ruby:2.5.7
RUN apt-get update && apt-get install -y smbclient
WORKDIR /code
COPY Gemfile* /code/
RUN bundle install -j 4
COPY . .
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
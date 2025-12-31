FROM ruby:3.1.2-slim

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libpq-dev nodejs yarn git curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bash"]
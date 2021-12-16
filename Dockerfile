FROM ruby:3.0.3-alpine3.15

RUN apk update && apk add --no-cache build-base

RUN bundle config set deployment 'true'

WORKDIR /app
COPY . /app
RUN bundle install --without development

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]

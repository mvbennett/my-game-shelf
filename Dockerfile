FROM 3.0.5-alpine3.16

WORKDIR /

COPY Gemfile .

RUN "bundle install"

COPY . .

EXPOSE 3000

CMD ["rails", "s"]

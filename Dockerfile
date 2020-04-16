FROM elixir:1.10.2-alpine AS builder

COPY . /helloworld/
WORKDIR /helloworld
RUN mix local.hex --force && mix local.rebar --force
RUN MIX_ENV=prod mix do deps.get, release

FROM alpine

RUN apk add --no-cache ncurses
COPY --from=builder /helloworld/_build/prod/rel/helloworld/ /helloworld/
WORKDIR /helloworld
EXPOSE 4001
ENTRYPOINT ["./bin/helloworld", "start"]

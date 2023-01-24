# ./Dockerfile

# Extend from the official Elixir image
FROM elixir:1.10.2-alpine

# Install required libraries on Alpine
# note: build-base required to run mix make for
# one of my dependecies (bcrypt)

RUN apk update && apk upgrade && \
  apk add postgresql-client && \
  apk add build-base && \
  rm -rf /var/cache/apk/*

# Set environment to production
ENV MIX_ENV prod

# Install hex package manager and rebar
# By using --force, we dont need to type Y to confirm the installation
RUN mix do local.hex --force, local.rebar --force

# Cache elixir dependecies and lock file
COPY mix.* ./

# Install and compile production dependecies
RUN mix do deps.get --only prod
RUN mix deps.compile

# Cache and install node packages and dependencies

# Copy all application files
COPY . ./

# Run frontend build, compile, and digest assets

# Run entrypoint.sh script
RUN chmod +x entrypoint.sh
CMD ["/entrypoint.sh"]

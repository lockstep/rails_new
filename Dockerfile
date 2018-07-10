FROM ruby:2-alpine

RUN apk update && apk add --update --no-cache \
  # C compiler etc
  build-base \
  # System specs
  chromium \
  chromium-chromedriver \
  # Support git sources in the Gemfile
  git \
  # Used by ActiveStorage
  imagemagick \
  # Dependencies for Nokogiri
  libxml2-dev \
  libxslt-dev \
  # Webpacker and friends
  nodejs \
  # Timezone data for Ruby's TZInfo library
  tzdata \
  # Used by the pg gem
  postgresql-dev

RUN bundle config build.nokogiri --use-system-libraries

WORKDIR /app

# Install JS dependencies before copying app code to use layer caching.
# Note: In JS heavy apps consider an approach similar to bundler.
COPY package.json ./
RUN npm install

COPY . .

# We use a custom script as entry point to manage our bundle cache
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# Setup environment for cached bundle
ENV BUNDLE_PATH=/gems \
    BUNDLE_BIN=/gems/bin \
    GEM_HOME=/gems
ENV PATH="${BUNDLE_BIN}:${PATH}"

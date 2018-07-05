#!/bin/sh

# Gems will be installed at runtime, NOT during the Docker build. This would not
# be a good approach for production systems since the setup is not always 100%
# reproducible, but it's much easier during development since new gems can be
# added via editing the Gemfile locally and then issuing the following command:
#   $ docker-compose exec app bundle install

# Exit on failure
set -e

# If necessary, install gems and their binstubs. `BUNDLE_BIN` is prepended to
# `PATH`` in the Dockerfile.
bundle check ||bundle install --binstubs="$BUNDLE_BIN"

# Execute the command specified in `docker-compose.yml`
exec "$@"

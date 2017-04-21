# frozen_string_literal: true

# See https://github.com/jollygoodcode/jollygoodcode.github.io/issues/12
# and https://bryanrite.com/heroku-puma-redis-sidekiq-and-connection-limits/
#
# Client Size = Puma Workers * (Puma Threads / 2) * Heroku Web Dynos
#
# Server Size = (Redis Connection Limit - Client Size - 2) / Heroku Job Dynos
# Server Size is set in sidekiq.yml in concurrency setting.
# Server size is concurrency + 2.

puma_workers = ENV.fetch('RAILS_WEB_CONCURRENCY', 1).to_i
puma_threads = ENV.fetch('RAILS_MAX_THREADS', 1).to_i

# If we only have one puma thread, the division could end up being 0
effective_threads = [(puma_threads / 2), 1].max

# configure this to reflect your Heroku setup
web_dynos = 1

client_size = puma_workers * effective_threads * web_dynos

Sidekiq.configure_client do |config|
  config.redis = { size: client_size, url: ENV['REDIS_URL'] }
end

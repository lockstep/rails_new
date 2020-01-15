# frozen_string_literal: true

Raven.configure do |config|
  config.dsn = ENV['SENTRY_DSN_BACKEND']
  config.async = lambda { |event|
    SentryWorker.perform_later(event)
  }
end

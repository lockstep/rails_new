# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = ENV['SENTRY_DSN_BACKEND']
  config.async = lambda { |event, hint|
    Sentry::SendEventJob.perform_later(event, hint)
  }
end

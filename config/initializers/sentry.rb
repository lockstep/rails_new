# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = ENV.fetch('SENTRY_DSN_BACKEND', nil)
  config.async = lambda { |event, hint|
    Sentry::SendEventJob.perform_later(event, hint)
  }
end

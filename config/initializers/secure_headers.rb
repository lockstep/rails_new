# frozen_string_literal: true

if Rails.env.production?
  require 'secure_headers'

  # See: https://github.com/twitter/secureheaders
  SecureHeaders::Configuration.default
end

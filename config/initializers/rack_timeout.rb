# Have Rack::Timeout kill requests after a specified amount of time. The timeout
# limit is configured by the RACK_TIMEOUT_SERVICE_TIMEOUT environment variable.
# See https://github.com/heroku/rack-timeout/blob/master/doc/settings.md for
# other config options.

# See https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#timeout

# Rack::Timeout logs a LOT when the logger is at the DEBUG level (i.e. in
# development).
Rack::Timeout.unregister_state_change_observer(:logger) unless Rails.env.development?

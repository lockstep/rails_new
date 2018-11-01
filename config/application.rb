# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

require_relative '../lib/rack/reject_trace'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# TODO: Change module name to the actual project name
module RailsNew
  class Application < Rails::Application
    ENV_TRUTHY = %w[enabled true t 1].freeze

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Configure generators, see: http://guides.rubyonrails.org/generators.html
    config.generators do |g|
      # Create appropriate tests in spec/ not test/
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_bot, dir: 'spec/factories'

      # Don't generate helpers, JS, CSS or view specs for controllers
      # See: http://guides.rubyonrails.org/generators.html
      g.helper      false
      g.javascripts false
      g.stylesheets false
      g.view_specs  false

      if ENV['BLOCK_HTTP_TRACE'].in?(ENV_TRUTHY)
        config.middleware.use Rack::RejectTrace
      end

      if ENV['RAILS_LOG_TO_STDOUT'].in?(ENV_TRUTHY)
        logger           = ActiveSupport::Logger.new(STDOUT)
        logger.formatter = config.log_formatter
        config.logger    = ActiveSupport::TaggedLogging.new(logger)
      end
    end
  end
end

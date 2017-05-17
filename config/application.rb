require_relative 'boot'

require 'rails/all'

require_relative '../lib/rack/reject_methods'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# TODO: Change module name to the actual project name
module RailsNew
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Use Sidekiq as ActiveJob backend
    config.active_job.queue_adapter = :sidekiq

    # Configure generators, see: http://guides.rubyonrails.org/generators.html
    config.generators do |g|
      # Create appropriate tests in spec/ not test/
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'

      # Don't generate helpers, JS, CSS or view specs for controllers
      # See: http://guides.rubyonrails.org/generators.html
      g.helper      false
      g.javascripts false
      g.stylesheets false
      g.view_specs  false

      if ENV['BLOCK_HTTP_TRACE'].in?(%w(true t 1))
        config.middleware.use Rack::RejectMethods
      end
    end
  end
end

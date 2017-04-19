# frozen_string_literal: true

# Documentation: https://github.com/thoughtbot/high_voltage#configuration
HighVoltage.configure do |config|
  # Remove '/pages' from URL by using the root route drawer
  config.route_drawer = HighVoltage::RouteDrawers::Root

  # Don't include HighVoltage default routes
  config.routes = false
end

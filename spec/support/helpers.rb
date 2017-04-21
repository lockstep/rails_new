# frozen_string_literal: true

require_relative 'helpers/response_helpers'
require_relative 'helpers/session_helpers'

RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.include Support::ResponseHelpers, type: :request
end

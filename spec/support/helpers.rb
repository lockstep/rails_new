# frozen_string_literal: true

require_relative 'helpers/response_helpers'
require_relative 'helpers/session_helpers'

RSpec.configure do |config|
  config.include SpecHelpers::SessionHelpers, type: :system
  config.include SpecHelpers::ResponseHelpers, type: :request
end

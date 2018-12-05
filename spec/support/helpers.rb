# frozen_string_literal: true

require_relative 'helpers/session_helpers'

RSpec.configure do |config|
  config.include SpecHelpers::SessionHelpers, type: :system
end

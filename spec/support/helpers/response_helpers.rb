# frozen_string_literal: true

module SpecHelpers
  module ResponseHelpers
    def response_json
      response.parsed_body
    end
  end
end

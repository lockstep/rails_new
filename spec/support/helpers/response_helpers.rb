# frozen_string_literal: true

module SpecHelpers
  module ResponseHelpers
    def response_json
      JSON.parse(response.body)
    end
  end
end

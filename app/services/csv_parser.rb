# frozen_string_literal: true

require 'csv'

class CsvParser < ApplicationService
  def initialize(file, options = {}) # rubocop:disable Lint/MissingSuper
    @file = file
    @default_options = {
      headers: true,
      header_converters: proc { |header|
                           header.downcase.tr(' ', '_')
                         },
    }

    @options = @default_options.merge(options)
  end

  def call
    CSV.parse(@file.read, **@options).map(&:to_h)
  end
end

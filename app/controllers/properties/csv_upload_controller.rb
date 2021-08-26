# frozen_string_literal: true

require 'csv'

module Properties
  class CsvUploadController < ApplicationController
    def create
      parsed_csv = CSV.parse(params["property-csv-file"].read, headers: true, header_converters: proc { |header| header.downcase.gsub(' ', '_') } )
      property_array = parsed_csv.map(&:to_h)
      Property.upsert_all(property_array, unique_by: :external_id)

      redirect_to properties_path
    end
  end
end

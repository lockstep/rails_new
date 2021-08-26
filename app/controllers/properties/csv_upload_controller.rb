# frozen_string_literal: true

module Properties
  class CsvUploadController < ApplicationController
    def create
      data = CsvParser.(params['property-csv-file'])

      Property.upsert_all(data, unique_by: :external_id)  # rubocop:disable Rails/SkipsModelValidations

      redirect_to root_path, flash: { notice: 'Property CSV has been uploaded' }
    end
  end
end

# frozen_string_literal: true

module Properties
  class CsvUploadController < ApplicationController
    def create
      PropertyImporter.call(params['property-csv-file'])

      redirect_to root_path, flash: { notice: 'Property CSV has been uploaded' }
    end
  end
end

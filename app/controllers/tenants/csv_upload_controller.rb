# frozen_string_literal: true

module Tenants
  class CsvUploadController < ApplicationController
    def create
      data = CsvParser.(params['tenant-csv-file'])

      Tenant.upsert_all(data, unique_by: :external_id)  # rubocop:disable Rails/SkipsModelValidations

      redirect_to root_path, flash: { notice: 'Tenant CSV has been uploaded' }
    end
  end
end

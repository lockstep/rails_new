# frozen_string_literal: true

require 'csv'

module Tenants
  class CsvUploadController < ApplicationController
    def create
      parsed_csv = CSV.parse(
        params['tenant-csv-file'].read,
        headers: true,
        header_converters: proc { |header|
                             header.downcase.tr(' ', '_')
                           },
      )
      tenant_array = parsed_csv.map(&:to_h)

      Tenant.upsert_all(tenant_array, unique_by: :external_id)  # rubocop:disable Rails/SkipsModelValidations

      redirect_to root_path, flash: { notice: 'Tenant CSV has been uploaded' }
    end
  end
end

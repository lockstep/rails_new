# frozen_string_literal: true

module Tenants
  class CsvUploadController < ApplicationController
    def create
      TenantImporter.call(params['tenant-csv-file'])

      redirect_to root_path, flash: { notice: 'Tenant CSV has been uploaded' }
    end
  end
end

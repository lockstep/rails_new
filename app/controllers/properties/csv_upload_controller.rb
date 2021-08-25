# frozen_string_literal: true

module Properties
  class CsvUploadController < ApplicationController
    def create
      redirect_to properties_path
    end
  end
end

# frozen_string_literal: true

module ActiveStorageHelper
  extend ActionDispatch::TestProcess

  def self.attach(name, type)
    file_path = Rails.root.join('spec', 'fixtures', 'files', name)
    fixture_file_upload(file_path, type)
  end
end

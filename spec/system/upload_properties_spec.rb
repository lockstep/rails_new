# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Property Uploader', type: :system do
  let(:property_csv_file) do
    Rails.root.join('spec/fixtures/files/properties.csv')
  end

  before do
    driven_by(:rack_test)
  end

  it 'uploads csv and redirects to property index page' do
    visit '/'

    attach_file 'property-csv-file', property_csv_file
    find('#upload-property-csv').click

    expect(page).to have_current_path('/properties')
    expect(page).to have_selector('.property-item', count: 3)
  end
end

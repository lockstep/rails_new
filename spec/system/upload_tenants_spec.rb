# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tenant Uploader', type: :system do
  let(:tenant_csv_file) do
    Rails.root.join('spec/fixtures/files/tenants.csv')
  end

  before do
    driven_by(:rack_test)
    create(:property)
  end

  it 'uploads csv and display data correctly' do
    visit '/'

    attach_file 'tenant-csv-file', tenant_csv_file
    find('#upload-tenant-csv').click

    expect(page).to have_content('Tenant CSV has been uploaded')

    click_on 'Properties'
    click_on 'Weber-Denesik'

    expect(page).to have_selector('.tenant-item', count: 7)
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tenant Uploader', type: :system do
  let(:tenant_csv_file) do
    Rails.root.join('spec/fixtures/files/tenants.csv')
  end

  before do
    driven_by(:rack_test)
    create(:property, external_id: 'PROP_1')
  end

  it 'uploads csv and display data correctly' do # rubocop:disable RSpec/MultipleExpectations
    visit '/'

    attach_file 'tenant-csv-file', tenant_csv_file
    find('#upload-tenant-csv').click

    expect(page).to have_content('Tenant CSV has been uploaded')

    click_on 'Properties'

    expect(page).to have_content('$442,020')

    click_on 'Weber-Denesik'

    expect(page).to have_selector('.tenant-item', count: 7)
    expect(page).to have_content('$442,020')
    expect(page).to have_content('16,782 m2')
    expect(page).to have_content('67.13%')
  end
end

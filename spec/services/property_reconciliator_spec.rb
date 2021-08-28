# frozen_string_literal: true

RSpec.describe PropertyReconciliator do
  before do
    @property = create(:property, leasable_area: 200)
    create_list(:tenant, 2, property_id: @property.external_id,
                            leasable_area: 25, base_rent: 100)

    described_class.(@property)
  end

  it 'updates leased_area' do
    expect(@property.leased_area).to eq(50)
  end

  it 'updates occupancy_rate' do
    expect(@property.occupancy_rate).to eq(25)
  end

  it 'updates monthly_rent' do
    expect(@property.monthly_rent).to eq(200)
  end
end

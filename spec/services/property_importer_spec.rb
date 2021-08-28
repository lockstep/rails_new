# frozen_string_literal: true

RSpec.describe PropertyImporter do
  let(:property_csv_file_1) do
    Rails.root.join('spec/fixtures/files/properties.csv')
  end

  let(:property_csv_file_2) do
    Rails.root.join('spec/fixtures/files/properties_2.csv')
  end  

  before do
    described_class.(property_csv_file_1)
    @prop_1 = Property.find_by(external_id: 'PROP_1')
  end

  it 'creates a correct number of properties' do
    expect(Property.count).to eq(3)
  end

  it 'creates properties according to the values from a csv' do
    expect(@prop_1.property_type).to eq('Office')
  end

  context 'when properties are existing' do
    before do
      described_class.(property_csv_file_2)
      @prop_1.reload
    end
    
    it 'does not create properties with the same external_id' do
      expect(Property.count).to eq(5)
    end

    it 'updates the existing properties' do
      expect(@prop_1.property_type).to eq('Retail')
    end
  end
end

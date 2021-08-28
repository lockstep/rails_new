# frozen_string_literal: true

RSpec.describe PropertyImporter do
  let(:property_csv_file_one) do
    Rails.root.join('spec/fixtures/files/properties.csv')
  end

  let(:property_csv_file_two) do
    Rails.root.join('spec/fixtures/files/properties_2.csv')
  end

  before do
    allow(PropertyReconciliator).to receive(:call)

    described_class.(property_csv_file_one)
    @property = Property.find_by(external_id: 'PROP_1')
  end

  it 'creates a correct number of properties' do
    expect(Property.count).to eq(3)
  end

  it 'creates properties according to the values from a csv' do
    expect(@property.property_type).to eq('Office')
  end

  it 'calls PropertyReconciliator' do
    expect(PropertyReconciliator).to have_received(:call)
      .with(instance_of(Property))
      .exactly(3).times
  end

  context 'when properties are existing' do
    before do
      described_class.(property_csv_file_two)
      @property.reload
    end

    it 'does not create properties with the same external_id' do
      expect(Property.count).to eq(5)
    end

    it 'updates the existing properties' do
      expect(@property.property_type).to eq('Retail')
    end
  end
end

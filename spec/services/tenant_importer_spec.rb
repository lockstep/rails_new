# frozen_string_literal: true

RSpec.describe TenantImporter do
  let(:tenant_csv_file_one) do
    Rails.root.join('spec/fixtures/files/tenants.csv')
  end

  let(:tenant_csv_file_two) do
    Rails.root.join('spec/fixtures/files/tenants_2.csv')
  end

  before do
    allow(PropertyReconciliator).to receive(:call)

    create(:property, external_id: 'PROP_1')
    described_class.(tenant_csv_file_one)
    @tenant = Tenant.find_by(external_id: 'TEN_1')
  end

  it 'creates a correct number of tenants' do
    expect(Tenant.count).to eq(42)
  end

  it 'creates tenants according to the values from a csv' do
    expect(@tenant.tenant_type).to eq('Office')
  end

  it 'calls PropertyReconciliator' do
    expect(PropertyReconciliator).to have_received(:call)
      .with(instance_of(Property))
      .exactly(1).times
  end

  context 'when tenants are existing' do
    before do
      described_class.(tenant_csv_file_two)
      @tenant.reload
    end

    it 'does not create tenants with the same external_id' do
      expect(Tenant.count).to eq(43)
    end

    it 'updates the existing tenants' do
      expect(@tenant.tenant_type).to eq('Retail')
    end
  end
end

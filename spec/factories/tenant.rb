# frozen_string_literal: true

FactoryBot.define do
  factory :tenant do
    sequence(:name) { |n| "Tenant_#{n}" }
    sequence(:external_id) { |n| "TEN_#{n}" }
    tenant_type { 'Office' }
    floor { '1' }
    leasable_area { 100 }
    lease_commenced_on { Time.zone.today }
    base_rent { 100 }
  end
end

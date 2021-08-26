# frozen_string_literal: true

FactoryBot.define do
  factory :property do
    name {'Weber-Denesik'}
    external_id {'PROP_1'}
    property_type {'Office'}
    city {'Los Angeles'}
    country {'USA'}
    acquisition_price { 49000000 }
    leasable_area { 25000.45 }
    acquired_on { Date.new(2016, 1, 3) }
  end
end

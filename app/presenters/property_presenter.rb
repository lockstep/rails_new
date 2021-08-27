# frozen_string_literal: true

class PropertyPresenter < ApplicationPresenter
  include ValueFormatter

  BASIC_INFO = {
    'Name' => 'name',
    'External id' => 'external_id',
    'Property type' => 'property_type',
    'City' => 'city',
    'Country' => 'country',
    'Acquisition price' => 'acquisition_price',
    'Leasable area' => 'leasable_area',
    'Acquired on' => 'acquired_on',
  }.freeze

  STATS_INFO = {
    'Leased area' => 'leased_area',
    'Occupancy rate' => 'occupancy_rate',
    'Total monthly rent' => 'total_monthly_rent',
  }.freeze

  forward :name, :external_id, :property_type, :city, :country

  def acquisition_price
    formatted_money(wrapped.acquisition_price)
  end

  def leasable_area
    formatted_area(wrapped.leasable_area)
  end

  def total_monthly_rent
    formatted_money(wrapped.monthly_rent)
  end

  def acquired_on
    formatted_date(wrapped.acquired_on)
  end

  def leased_area
    formatted_area(wrapped.leased_area)
  end

  def occupancy_rate
    formatted_percentage(wrapped.occupancy_rate)
  end
end

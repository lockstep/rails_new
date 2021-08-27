# frozen_string_literal: true

class PropertyPresenter < ApplicationPresenter
  include ValueFormatter

  BASIC_INFO = ['name', 'external_id', 'property_type', 'city', 'country',
                'acquisition_price', 'leasable_area', 'acquired_on'].freeze
  STATS_INFO = ['leased_area', 'occupancy_rate', 'total_monthly_rent'].freeze

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

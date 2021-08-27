# frozen_string_literal: true

class PropertyPresenter < ApplicationPresenter
  include ActionView::Helpers::NumberHelper

  forward :name, :country

  def monthly_rent
    number_to_currency(
      wrapped.monthly_rent / 100.00,
      strip_insignificant_zeros: true,
    )
  end

  def leased_area
    number = number_with_precision(
      wrapped.leased_area / 100.00, precision: 2,
                                    delimiter: ',', strip_insignificant_zeros: true # rubocop:disable Layout/LineLength
    )
    "#{number} m2"
  end

  def occupancy_rate
    number_to_percentage(
      wrapped.occupancy_rate, precision: 2,
                              strip_insignificant_zeros: true
    )
  end
end

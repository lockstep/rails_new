# frozen_string_literal: true

module ValueFormatter
  include ActionView::Helpers::NumberHelper

  def formatted_money(money)
    number_to_currency(money / 100.00, strip_insignificant_zeros: true)
  end

  def formatted_area(area)
    number = number_with_precision(
      area / 100.00, precision: 2,
                     delimiter: ',', strip_insignificant_zeros: true
    )
    "#{number} m2"
  end

  def formatted_date(date)
    date.strftime('%b %d, %Y')
  end

  def formatted_percentage(percentage)
    number_to_percentage(
      percentage, precision: 2,
                  strip_insignificant_zeros: true
    )
  end
end

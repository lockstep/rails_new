# frozen_string_literal: true

module CsvSanitizer
  def sanitize_money(money)
    money = money.gsub(/[^.0-9]/, '') if money.is_a?(String)

    (money.to_f.round(2) * 100).to_i
  end

  def sanitize_area(area)
    area = area.gsub(/[^.0-9]/, '') if area.is_a?(String)

    (area.to_f.round(2) * 100).to_i
  end

  def sanitize_date(string_date)
    month, day, year = string_date.split('/').map(&:to_i)

    Date.new(year, month, day)
  end
end

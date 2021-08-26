module CsvSanitizer
  def sanitize_money(money)
    if money.is_a?(String)
      money = money.gsub(/[^.0-9]/, '')
    end

    (money.to_f.round(2) * 100).to_i
  end

  def sanitize_area(area)
    if area.is_a?(String)
      area = area.gsub(/[^.0-9]/, '')
    end

    (area.to_f.round(2) * 100).to_i
  end

  def sanitize_date(string_date)
    month, day, year = string_date.split("/").map(&:to_i)

    Date.new(year, day, month)
  end
end

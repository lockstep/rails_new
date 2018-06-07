# frozen_string_literal: true

module ApplicationHelper
  # Translate Rails standard flash keys for Bootstrap
  def flash_alert_class(name)
    case name
    when 'notice' then 'alert-success'
    when 'alert'  then 'alert-danger'
    else name
    end
  end
end

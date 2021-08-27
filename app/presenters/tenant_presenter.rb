# frozen_string_literal: true

class TenantPresenter < ApplicationPresenter
  include ValueFormatter

  BASIC_INFO = ["name", "external_id", "property_id", "tenant_type", "floor", "leasable_area", "lease_commenced_on", "base_rent"].freeze


  forward :name, :external_id, :property_id, :tenant_type, :floor, :property_id, :property_name

  def leasable_area
    formatted_area(wrapped.leasable_area)
  end

  def base_rent
    formatted_money(wrapped.base_rent)
  end

  def lease_commenced_on
    formatted_date(wrapped.lease_commenced_on)
  end

  def property_internal_id
    wrapped.property.id
  end

  def property_name
    wrapped.property.name
  end
end

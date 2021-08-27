# frozen_string_literal: true

class TenantPresenter < ApplicationPresenter
  include ValueFormatter

  BASIC_INFO = {
    'Name' => 'name',
    'External id' => 'external_id',
    'Property id' => 'property_id',
    'Tenant type' => 'tenant_type',
    'Floor' => 'floor',
    'Leasable area' => 'leasable_area',
    'Lease commenced on' => 'lease_commenced_on',
    'Base rent' => 'base_rent',
  }.freeze

  forward :name, :external_id, :property_id, :tenant_type, :floor

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

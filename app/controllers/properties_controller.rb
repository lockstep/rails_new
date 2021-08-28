# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    properties = Property.all.order('monthly_rent DESC')
    @property_presenters = PropertyPresenter.present_collection(properties)
  end

  def show
    property = Property.find(params[:id])
    tenants = property.tenants.order('base_rent DESC')

    @property_presenter = PropertyPresenter.new(property)
    @tenant_presenters = TenantPresenter.present_collection(tenants)
  end
end

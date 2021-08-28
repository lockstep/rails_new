# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    @property_presenters = PropertyPresenter.present_collection(
      Property.all.order('monthly_rent DESC'),
    )
  end

  def show
    property = Property.find(params[:id])

    @property_presenter = PropertyPresenter.new(property)
    @tenant_presenters = TenantPresenter.present_collection(property.tenants.order('base_rent DESC'))
  end
end

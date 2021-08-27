# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    @property_presenters = PropertyPresenter.present_collection(Property.all)
  end

  def show
    property = Property.find(params[:id])

    @property_presenter = PropertyPresenter.new(property)
    @tenant_presenters = TenantPresenter.present_collection(property.tenants)
  end
end

# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    @properties = PropertyPresenter.decorate_collection(Property.all)
  end

  def show
    property = Property.find(params[:id])
    @property = PropertyPresenter.new(property)
    @tenants = property.tenants
  end
end

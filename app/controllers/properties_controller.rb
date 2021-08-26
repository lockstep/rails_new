# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    @tenants = @property.tenants
  end
end

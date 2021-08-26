# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end
end

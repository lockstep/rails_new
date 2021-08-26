# frozen_string_literal: true

class Property < ApplicationRecord
  has_many :tenants, primary_key: "external_id", foreign_key: "property_id"
end

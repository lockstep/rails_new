class Tenant < ApplicationRecord
  belongs_to :property, primary_key: "external_id", foreign_key: "property_id"
end

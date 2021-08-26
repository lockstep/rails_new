# frozen_string_literal: true

class Tenant < ApplicationRecord
  belongs_to :property, primary_key: 'external_id'
end

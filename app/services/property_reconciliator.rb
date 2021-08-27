# frozen_string_literal: true

class PropertyReconciliator < ApplicationService
  include CsvSanitizer

  def initialize(property) # rubocop:disable Lint/MissingSuper
    @property = property
  end

  def call
    tenants = @property.tenants

    @property.monthly_rent = tenants.sum(:base_rent)
    @property.leased_area = tenants.sum(:leasable_area)
    @property.occupancy_rate = (@property.leased_area / @property.leasable_area.to_f) * 100 # rubocop:disable Layout/LineLength

    @property.save
  end
end

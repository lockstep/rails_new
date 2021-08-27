class AddLeasedAreaAndOccupacyRateToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :leased_area, :bigint, default: 0
    add_column :properties, :occupancy_rate, :decimal, precision: 10, scale: 2, default: 0
  end
end

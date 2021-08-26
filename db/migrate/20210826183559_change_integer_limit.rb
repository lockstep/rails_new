class ChangeIntegerLimit < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        change_column :properties, :acquisition_price, :bigint
        change_column :properties, :leasable_area, :bigint
        change_column :properties, :monthly_rent, :bigint
        change_column :tenants, :leasable_area, :bigint
        change_column :tenants, :base_rent, :bigint
      end

      dir.down do
        change_column :properties, :acquisition_price, :integer
        change_column :properties, :leasable_area, :integer
        change_column :properties, :monthly_rent, :integer
        change_column :tenants, :leasable_area, :integer
        change_column :tenants, :base_rent, :integer
      end
    end
  end
end

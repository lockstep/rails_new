class CreateTenants < ActiveRecord::Migration[6.1]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :external_id
      t.string :property_id
      t.string :tenant_type
      t.string :floor
      t.integer :leasable_area
      t.datetime :lease_commenced_on
      t.integer :base_rent

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :tenants, :external_id, unique: true
    add_index :tenants, :property_id
  end
end

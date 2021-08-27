# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_26_205121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authenticatable_type", null: false
    t.bigint "authenticatable_id", null: false
    t.index ["authenticatable_type", "authenticatable_id"], name: "index_accounts_on_authenticatable_type_and_authenticatable_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "external_id"
    t.string "property_type"
    t.string "city"
    t.string "country"
    t.bigint "acquisition_price"
    t.bigint "leasable_area"
    t.datetime "acquired_on"
    t.bigint "monthly_rent", default: 0
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "leased_area", default: 0
    t.decimal "occupancy_rate", precision: 10, scale: 2, default: "0.0"
    t.index ["external_id"], name: "index_properties_on_external_id", unique: true
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "external_id"
    t.string "property_id"
    t.string "tenant_type"
    t.string "floor"
    t.bigint "leasable_area"
    t.datetime "lease_commenced_on"
    t.bigint "base_rent"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["external_id"], name: "index_tenants_on_external_id", unique: true
    t.index ["property_id"], name: "index_tenants_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

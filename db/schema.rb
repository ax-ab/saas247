# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_25_173152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_licenses", force: :cascade do |t|
    t.bigint "license_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "active_users"
    t.index ["company_id"], name: "index_company_licenses_on_company_id"
    t.index ["license_id"], name: "index_company_licenses_on_license_id"
  end

  create_table "license_transactions", force: :cascade do |t|
    t.bigint "company_license_id"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_licenses_purchased"
    t.integer "total_purchase_price"
    t.date "purchase_date"
    t.date "expiry_date"
    t.string "commitment_period"
    t.index ["company_license_id"], name: "index_license_transactions_on_company_license_id"
    t.index ["owner_id"], name: "index_license_transactions_on_owner_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "license_type"
    t.string "logo_url"
    t.integer "avg_license_cost"
    t.index ["category_id"], name: "index_licenses_on_category_id"
    t.index ["vendor_id"], name: "index_licenses_on_vendor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.string "department"
    t.string "first_name"
    t.string "last_name"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "company_licenses", "companies"
  add_foreign_key "company_licenses", "licenses"
  add_foreign_key "license_transactions", "company_licenses"
  add_foreign_key "license_transactions", "users", column: "owner_id"
  add_foreign_key "licenses", "categories"
  add_foreign_key "licenses", "vendors"
  add_foreign_key "users", "companies"
end

# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151116230356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string   "status"
    t.integer  "goal"
    t.integer  "profit"
    t.string   "title"
    t.string   "description"
    t.datetime "length"
    t.binary   "image"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "product_id"
    t.integer  "supplier_id"
  end

  add_index "campaigns", ["product_id"], name: "index_campaigns_on_product_id", using: :btree
  add_index "campaigns", ["supplier_id"], name: "index_campaigns_on_supplier_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
  end

  add_index "customers", ["username"], name: "index_customers_on_username", unique: true, using: :btree

  create_table "designers", force: :cascade do |t|
    t.string   "email"
    t.integer  "profit"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.string   "password_digest"
  end

  add_index "designers", ["username"], name: "index_designers_on_username", unique: true, using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "zip_code"
    t.integer  "qty"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "card_token"
    t.integer  "campaign_id"
    t.integer  "customer_id"
    t.string   "full_name"
    t.string   "email"
  end

  add_index "orders", ["campaign_id"], name: "index_orders_on_campaign_id", using: :btree
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.decimal  "x"
    t.decimal  "y"
    t.decimal  "z"
    t.integer  "base_cost"
    t.integer  "profit"
    t.boolean  "color"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "name"
    t.integer  "designer_id"
    t.string   "object_file_name"
    t.string   "object_content_type"
    t.integer  "object_file_size"
    t.datetime "object_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "products", ["designer_id"], name: "index_products_on_designer_id", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "company_name"
    t.string   "address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "email"
    t.integer  "price_per_cm3"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "suppliers", ["username"], name: "index_suppliers_on_username", unique: true, using: :btree

  add_foreign_key "campaigns", "products"
  add_foreign_key "campaigns", "suppliers"
  add_foreign_key "orders", "campaigns"
  add_foreign_key "orders", "customers"
  add_foreign_key "products", "designers"
end

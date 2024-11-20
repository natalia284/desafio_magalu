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

ActiveRecord::Schema[7.1].define(version: 5) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archives", force: :cascade do |t|
    t.string "archive_hash"
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "archive_id", null: false
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.index ["archive_id"], name: "index_order_products_on_archive_id"
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "archive_id"
    t.bigint "user_id"
    t.decimal "total", precision: 15, scale: 2
    t.date "date"
    t.index ["archive_id"], name: "index_orders_on_archive_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "archive_id"
    t.bigint "order_id"
    t.decimal "value", precision: 12, scale: 2
    t.index ["archive_id"], name: "index_products_on_archive_id"
    t.index ["order_id"], name: "index_products_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "archive_id"
    t.string "name", limit: 45
    t.index ["archive_id"], name: "index_users_on_archive_id"
  end

  add_foreign_key "order_products", "archives"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "archives"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "archives"
  add_foreign_key "products", "orders"
  add_foreign_key "users", "archives"
end

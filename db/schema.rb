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

ActiveRecord::Schema[8.0].define(version: 2025_05_02_052735) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "foods", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "allergy"
    t.boolean "freezed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "subscription_id", null: false
    t.date "delivery_on", null: false
    t.string "delivery_time_zone", null: false
    t.string "status", null: false
    t.integer "price", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_orders_on_subscription_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "plan_foods", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.bigint "food_id", null: false
    t.integer "amount", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_plan_foods_on_food_id"
    t.index ["plan_id", "food_id"], name: "index_plan_foods_on_plan_id_and_food_id", unique: true
  end

  create_table "plans", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.integer "price", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plan_id", null: false
    t.string "delivery_frequency", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id", "user_id"], name: "index_subscriptions_on_plan_id_and_user_id", unique: true
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "prefecture", default: "", null: false
    t.string "city", default: "", null: false
    t.string "address", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "allergy"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "subscriptions"
  add_foreign_key "orders", "users"
  add_foreign_key "plan_foods", "foods"
  add_foreign_key "plan_foods", "plans"
  add_foreign_key "subscriptions", "plans"
  add_foreign_key "subscriptions", "users"
end

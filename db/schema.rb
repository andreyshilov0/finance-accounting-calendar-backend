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

ActiveRecord::Schema[7.0].define(version: 2023_08_11_110255) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "income_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_income_categories_on_name", unique: true
  end

  create_table "incomes", force: :cascade do |t|
    t.bigint "income_category_id", null: false
    t.float "amount", null: false
    t.date "date", null: false
    t.string "name", null: false
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_category_id"], name: "index_incomes_on_income_category_id"
  end

  create_table "incomes_users", id: false, force: :cascade do |t|
    t.bigint "income_id", null: false
    t.bigint "user_id", null: false
    t.index ["income_id", "user_id"], name: "index_incomes_users_on_income_id_and_user_id"
    t.index ["user_id", "income_id"], name: "index_incomes_users_on_user_id_and_income_id"
  end

  create_table "payment_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_payment_categories_on_name", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "payment_category_id", null: false
    t.float "amount", null: false
    t.date "date", null: false
    t.string "name", null: false
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_category_id"], name: "index_payments_on_payment_category_id"
  end

  create_table "payments_users", id: false, force: :cascade do |t|
    t.bigint "payment_id", null: false
    t.bigint "user_id", null: false
    t.index ["payment_id", "user_id"], name: "index_payments_users_on_payment_id_and_user_id"
    t.index ["user_id", "payment_id"], name: "index_payments_users_on_user_id_and_payment_id"
  end

  create_table "users", force: :cascade do |t|
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

  add_foreign_key "incomes", "income_categories"
  add_foreign_key "payments", "payment_categories"
end

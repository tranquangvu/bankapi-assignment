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

ActiveRecord::Schema[7.0].define(version: 2023_03_14_181525) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.string "bank_number", null: false
    t.decimal "balance", precision: 10, scale: 2, default: "0.0", null: false
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_number"], name: "index_bank_accounts_on_bank_number", unique: true
    t.index ["customer_id"], name: "index_bank_accounts_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "fullname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "transfers", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.bigint "from_bank_account_id"
    t.bigint "to_bank_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_bank_account_id"], name: "index_transfers_on_from_bank_account_id"
    t.index ["to_bank_account_id"], name: "index_transfers_on_to_bank_account_id"
  end

  add_foreign_key "bank_accounts", "customers"
  add_foreign_key "transfers", "bank_accounts", column: "from_bank_account_id"
  add_foreign_key "transfers", "bank_accounts", column: "to_bank_account_id"
end

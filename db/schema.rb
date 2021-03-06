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

ActiveRecord::Schema.define(version: 20150130005219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string  "name"
    t.string  "practice_name"
    t.string  "office_phone"
    t.string  "email"
    t.integer "user_id"
  end

  create_table "drugs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fillings", force: :cascade do |t|
    t.integer  "prescription_id"
    t.datetime "date_filled"
    t.float    "price_paid"
    t.integer  "user_id"
    t.integer  "pharmacy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "medicare_paid"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string  "name"
    t.string  "phone"
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.text    "url"
    t.integer "user_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer  "drug_id"
    t.string   "drug_uom"
    t.integer  "renewal_interval"
    t.integer  "quantity_prescribed"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doctor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

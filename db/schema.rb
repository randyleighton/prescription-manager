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

ActiveRecord::Schema.define(version: 20140909011510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drugs", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "cost_not_in_dh"
    t.float    "cost_in_dh"
    t.float    "bill_to_dh"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ledgers", force: true do |t|
    t.integer  "donut_hole_total"
    t.integer  "ytd_paid_total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prescriptions", force: true do |t|
    t.integer  "drug_id"
    t.string   "drug_uom"
    t.integer  "renewal_interval"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prescriptions_transactions", force: true do |t|
    t.integer  "prescription_id"
    t.integer  "ledger_id"
    t.date     "date"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

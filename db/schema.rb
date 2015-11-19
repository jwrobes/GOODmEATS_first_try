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

ActiveRecord::Schema.define(version: 20151022025242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "meats", force: true do |t|
    t.string "name"
  end

  create_table "restaurant_meats", force: true do |t|
    t.integer "restaurant_id"
    t.integer "source_meat_id"
    t.text    "description"
  end

  add_index "restaurant_meats", ["restaurant_id"], name: "index_restaurant_meats_on_restaurant_id", using: :btree
  add_index "restaurant_meats", ["source_meat_id"], name: "index_restaurant_meats_on_source_meat_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string "name"
    t.string "foursquare_id"
    t.float  "latitude"
    t.float  "longitude"
    t.hstore "location"
  end

  create_table "source_meats", force: true do |t|
    t.integer "source_id"
    t.integer "meat_id"
    t.string  "name"
    t.text    "description"
    t.integer "rating",      limit: 2
  end

  add_index "source_meats", ["meat_id"], name: "index_source_meats_on_meat_id", using: :btree
  add_index "source_meats", ["source_id"], name: "index_source_meats_on_source_id", using: :btree

  create_table "sources", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
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
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

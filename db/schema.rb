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

ActiveRecord::Schema.define(version: 20151028171941) do

  create_table "clients", force: :cascade do |t|
    t.string  "lastname",    limit: 255
    t.string  "firstname",   limit: 255
    t.string  "patronymic",  limit: 255
    t.integer "passport",    limit: 4
    t.string  "address",     limit: 255
    t.string  "phonenumber", limit: 255
    t.integer "group_id",    limit: 4
  end

  add_index "clients", ["group_id"], name: "fk_rails_3b75901880", using: :btree

  create_table "desired_routes", force: :cascade do |t|
    t.integer "client_id", limit: 4
    t.integer "route_id",  limit: 4
  end

  add_index "desired_routes", ["client_id"], name: "fk_rails_ccd2cee732", using: :btree
  add_index "desired_routes", ["route_id"], name: "fk_rails_b591131094", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string  "lastname",   limit: 255
    t.string  "firstname",  limit: 255
    t.string  "patronymic", limit: 255
    t.boolean "vacant",                 default: true
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "travel_date"
    t.integer  "employee_id", limit: 4
    t.integer  "route_id",    limit: 4
  end

  add_index "groups", ["employee_id"], name: "fk_rails_d0004c07a5", using: :btree
  add_index "groups", ["route_id"], name: "fk_rails_a76c80765a", using: :btree

  create_table "routes", force: :cascade do |t|
    t.string  "country",  limit: 255
    t.integer "duration", limit: 4
    t.integer "cost",     limit: 4
  end

  add_foreign_key "clients", "groups"
  add_foreign_key "desired_routes", "clients"
  add_foreign_key "desired_routes", "routes"
  add_foreign_key "groups", "employees"
  add_foreign_key "groups", "routes"
end

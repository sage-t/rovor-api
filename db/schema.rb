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

ActiveRecord::Schema.define(version: 20170917213213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.string   "email",                          null: false
    t.string   "name",                           null: false
    t.integer  "user_id"
    t.integer  "state",          default: 1,     null: false
    t.date     "outbound_start",                 null: false
    t.date     "outbound_end",                   null: false
    t.date     "inbound_start"
    t.date     "inbound_end"
    t.string   "start_airports",                 null: false
    t.string   "end_airports",                   null: false
    t.integer  "trip_len_min",   default: -1,    null: false
    t.integer  "trip_len_max",   default: -1,    null: false
    t.integer  "price_limit",    default: -1,    null: false
    t.boolean  "auto_alert",     default: false, null: false
    t.datetime "last_searched"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "deals", force: :cascade do |t|
    t.integer  "alert_id"
    t.integer  "price",         null: false
    t.string   "start_airport", null: false
    t.string   "end_airport",   null: false
    t.date     "outbound",      null: false
    t.date     "inbound"
    t.text     "link",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end

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

ActiveRecord::Schema.define(version: 20160531105540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string  "name"
    t.integer "state_id"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "configurations", force: :cascade do |t|
    t.string   "from_email"
    t.integer  "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "configurations", ["plan_id"], name: "index_configurations_on_plan_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "delivery_contents", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "action_url"
    t.string   "title"
  end

  add_index "delivery_contents", ["group_id"], name: "index_delivery_contents_on_group_id", using: :btree
  add_index "delivery_contents", ["medium_id"], name: "index_delivery_contents_on_medium_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "status"
    t.integer  "configuration_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "groups", ["configuration_id"], name: "index_groups_on_configuration_id", using: :btree

  create_table "leads", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.integer  "city_id"
  end

  add_index "leads", ["city_id"], name: "index_leads_on_city_id", using: :btree
  add_index "leads", ["group_id"], name: "index_leads_on_group_id", using: :btree
  add_index "leads", ["status"], name: "index_leads_on_status", using: :btree

  create_table "media", force: :cascade do |t|
    t.string   "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",       precision: 10, scale: 2
    t.integer  "status"
    t.integer  "kind"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "subtitle"
    t.boolean  "featured",                             default: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "initials"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cities", "states"
  add_foreign_key "configurations", "plans"
  add_foreign_key "delivery_contents", "groups"
  add_foreign_key "delivery_contents", "media"
  add_foreign_key "groups", "configurations"
  add_foreign_key "leads", "cities"
  add_foreign_key "leads", "groups"
end

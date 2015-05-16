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

ActiveRecord::Schema.define(version: 20150516012243) do

  create_table "attorneys", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "office_address"
    t.string   "fax_number"
    t.string   "bar_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "attorneys", ["user_id"], name: "index_attorneys_on_user_id"

  create_table "cases", force: :cascade do |t|
    t.string   "case_number"
    t.integer  "rent_due"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "telephone"
    t.string   "street_address"
    t.string   "mailing_address"
    t.string   "landlord"
    t.string   "other_people"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id"

  create_table "defenses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "defenses_users", id: false, force: :cascade do |t|
    t.integer "defense_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "defenses_users", ["defense_id", "user_id"], name: "index_defenses_users_on_defense_id_and_user_id"
  add_index "defenses_users", ["user_id", "defense_id"], name: "index_defenses_users_on_user_id_and_defense_id"

  create_table "joined_tables", force: :cascade do |t|
    t.integer "user_id"
    t.integer "defense_id"
  end

  add_index "joined_tables", ["defense_id"], name: "index_joined_tables_on_defense_id"
  add_index "joined_tables", ["user_id"], name: "index_joined_tables_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.boolean  "required"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "kind"
    t.integer  "prev_id"
    t.integer  "next1_id"
    t.integer  "next2_id"
    t.text     "response1"
    t.text     "response2"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "god_mode",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120508151850) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["user_id"], :name => "index_categories_on_user_id"

  create_table "entries", :force => true do |t|
    t.string   "concept"
    t.float    "amount"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["category_id"], :name => "index_entries_on_category_id"
  add_index "entries", ["user_id"], :name => "index_entries_on_user_id"

  create_table "expenses", :force => true do |t|
    t.string   "concept"
    t.float    "amount"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["category_id"], :name => "index_expenses_on_category_id"
  add_index "expenses", ["user_id"], :name => "index_expenses_on_user_id"

  create_table "reports", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

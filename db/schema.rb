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

ActiveRecord::Schema.define(:version => 20131102054948) do

  create_table "bugs", :force => true do |t|
    t.integer  "task_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "columns", :force => true do |t|
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.boolean  "fixed"
    t.integer  "capacity"
    t.integer  "position"
    t.string   "type"
  end

  create_table "comments", :force => true do |t|
    t.integer  "task_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "body"
    t.integer  "author_id"
    t.string   "type"
  end

  create_table "estimates", :force => true do |t|
    t.decimal  "value"
    t.string   "label"
    t.integer  "project_id"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "issues", :force => true do |t|
    t.string   "url"
    t.integer  "task_id"
    t.boolean  "resolved"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_memeberships", :force => true do |t|
    t.string   "email"
    t.string   "permission"
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "url"
    t.string   "type"
  end

  create_table "subtasks", :force => true do |t|
    t.string   "body"
    t.integer  "task_id"
    t.integer  "creator_id"
    t.boolean  "completed"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "task_subscriptions", :force => true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "task_types", :force => true do |t|
    t.string   "name"
    t.integer  "color_code"
    t.integer  "project_id"
    t.integer  "position"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "column_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "title"
    t.integer  "task_type_id"
    t.integer  "creator_id"
    t.string   "description"
    t.integer  "estimate_id"
    t.integer  "owner_id"
    t.integer  "position"
    t.integer  "priority"
    t.boolean  "ready_to_pull"
    t.boolean  "blocked"
    t.datetime "moved_at"
    t.string   "type"
  end

  create_table "updates", :force => true do |t|
    t.integer  "resource_type"
    t.integer  "update_type"
    t.integer  "resource_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "auth_token"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "api_token"
    t.string   "last_name"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "remember_token"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           :default => false
    t.string   "first_name"
    t.string   "type"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "veenda_tests", :force => true do |t|
    t.integer  "tester_id"
    t.integer  "developer_id"
    t.string   "description"
    t.string   "result"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "workspaces", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "type"
  end

end

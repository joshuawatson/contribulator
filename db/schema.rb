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

ActiveRecord::Schema.define(version: 20150105182230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: :cascade do |t|
    t.integer  "github_id",              null: false
    t.string   "url",                    null: false
    t.string   "title",                  null: false
    t.string   "state"
    t.integer  "comments",   default: 0
    t.datetime "closed_at"
    t.text     "body"
    t.integer  "project_id",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "owner",         limit: 255
    t.string   "homepage",      limit: 255
    t.string   "main_language", limit: 255
    t.integer  "github_id"
    t.boolean  "fork",                      default: false
    t.float    "score",                     default: 0.0
    t.text     "description"
    t.datetime "last_scored"
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid",         limit: 255, null: false
    t.string   "nickname",    limit: 255, null: false
    t.string   "gravatar_id", limit: 255
    t.string   "token",       limit: 255
    t.string   "email",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true, using: :btree

end

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

ActiveRecord::Schema.define(version: 20150909035027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "article_type"
    t.text     "annotation"
    t.text     "content"
    t.integer  "issue_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "issues", force: :cascade do |t|
    t.integer  "number"
    t.integer  "global_id"
    t.date     "release_at"
    t.string   "state",      default: "draft"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "context_id"
    t.string   "context_type"
    t.string   "role"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["user_id", "role", "context_id", "context_type"], name: "by_user_and_role_and_context", unique: true, using: :btree

end

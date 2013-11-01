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

ActiveRecord::Schema.define(version: 20131101190720) do

  create_table "categs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "name"
    t.integer  "year"
    t.text     "body"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts_subcategs", force: true do |t|
    t.integer "post_id"
    t.integer "subcateg_id"
  end

  create_table "subcategs", force: true do |t|
    t.string   "name"
    t.integer  "categ_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

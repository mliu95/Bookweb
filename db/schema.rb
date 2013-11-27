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

ActiveRecord::Schema.define(version: 20131127231129) do

  create_table "books", force: true do |t|
    t.string   "school_id"
    t.string   "email"
    t.string   "department"
    t.integer  "course_num"
    t.string   "title"
    t.integer  "isbn"
    t.string   "condition"
    t.decimal  "asking_price"
    t.datetime "expiration",   default: '2013-12-12 04:59:59'
    t.string   "author"
  end

  create_table "courses", force: true do |t|
    t.string   "department"
    t.integer  "course_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.integer  "transaction_count"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

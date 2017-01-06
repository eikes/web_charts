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

ActiveRecord::Schema.define(version: 20170106110246) do

  create_table "charts", force: :cascade do |t|
    t.string   "title"
    t.string   "background_color"
    t.integer  "columns"
    t.text     "grouplabels"
    t.integer  "height"
    t.integer  "width"
    t.integer  "item_height"
    t.integer  "item_width"
    t.string   "file_type"
    t.string   "style"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "data", force: :cascade do |t|
    t.float    "value"
    t.string   "color"
    t.string   "label"
    t.integer  "chart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

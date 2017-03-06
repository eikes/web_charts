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
    t.text     "data",             default: "[[0]]"
    t.text     "row_labels",       default: "[]"
    t.text     "column_labels",    default: "[]"
    t.text     "colors",           default: "[]"
    t.integer  "height"
    t.integer  "width"
    t.string   "background_color", default: "#ffffff"
    t.string   "file_type",        default: "svg"
    t.string   "style",            default: "bar"
    t.string   "color_scheme",     default: "Set1"
    t.integer  "item_height"
    t.integer  "item_width"
    t.integer  "item_columns"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

end

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

ActiveRecord::Schema.define(version: 20160922081450) do

  create_table "cms9_fields", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "post_field_id"
    t.string   "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["post_field_id"], name: "index_fields_on_post_field_id"
    t.index ["post_id"], name: "index_fields_on_post_id"
  end

  create_table "cms9_post_definitions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cms9_post_fields", force: :cascade do |t|
    t.integer  "post_definition_id"
    t.string   "name"
    t.string   "field_type"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "required",           default: false, null: false
    t.string   "multiple_choices"
    t.index ["post_definition_id"], name: "index_post_fields_on_post_definition_id"
  end

  create_table "cms9_posts", force: :cascade do |t|
    t.integer  "post_definition_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["post_definition_id"], name: "index_posts_on_post_definition_id"
  end

end

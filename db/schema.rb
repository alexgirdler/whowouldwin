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

ActiveRecord::Schema.define(version: 20150731213634) do

  create_table "attachinary_files", force: :cascade do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"

  create_table "contestant_stats", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "contestant_id"
    t.integer  "stat_id"
  end

  add_index "contestant_stats", ["contestant_id"], name: "index_contestant_stats_on_contestant_id"
  add_index "contestant_stats", ["stat_id"], name: "index_contestant_stats_on_stat_id"

  create_table "contestants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contestants_showdowns", id: false, force: :cascade do |t|
    t.integer "showdown_id"
    t.integer "contestant_id"
  end

  add_index "contestants_showdowns", ["contestant_id"], name: "index_contestants_showdowns_on_contestant_id"
  add_index "contestants_showdowns", ["showdown_id"], name: "index_contestants_showdowns_on_showdown_id"

  create_table "showdowns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "showdown_id"
  end

  add_index "stats", ["showdown_id"], name: "index_stats_on_showdown_id"

  create_table "votes", force: :cascade do |t|
    t.string   "user"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "contestant_id"
    t.integer  "showdown_id"
  end

  add_index "votes", ["contestant_id"], name: "index_votes_on_contestant_id"
  add_index "votes", ["showdown_id"], name: "index_votes_on_showdown_id"

end

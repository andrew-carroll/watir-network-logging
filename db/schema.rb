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

ActiveRecord::Schema.define(version: 20150611153006) do

  create_table "requests", force: :cascade do |t|
    t.string   "request_line",    null: false
    t.string   "host",            null: false
    t.string   "user_agent"
    t.string   "accept"
    t.string   "accept_language"
    t.string   "accept_encoding"
    t.string   "referer"
    t.string   "connection"
    t.string   "cookie"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer "request_id",             null: false
    t.string  "proxy_connection"
    t.string  "connection"
    t.string  "date",                   null: false
    t.string  "server",                 null: false
    t.string  "vary"
    t.string  "content_encoding"
    t.string  "x_content_type_options"
    t.string  "content_type",           null: false
    t.string  "via"
    t.string  "body"
  end

  add_index "responses", ["request_id"], name: "index_responses_on_request_id"

end

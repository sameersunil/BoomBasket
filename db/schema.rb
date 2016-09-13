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

ActiveRecord::Schema.define(version: 20160913124143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airplanes", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "img_url"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "email"
    t.float    "total"
    t.string   "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "img_url"
    t.integer  "airplane_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "cat"
    t.string   "name"
    t.integer  "price"
    t.string   "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "pwd"
  end

end

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

ActiveRecord::Schema.define(version: 20150616141643) do

  create_table "student_extras", force: :cascade do |t|
    t.integer  "student_id", null: false
    t.string   "key",        null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_extras", ["student_id"], name: "index_student_extras_on_student_id"

  create_table "student_gpas", force: :cascade do |t|
    t.integer  "student_id", null: false
    t.string   "key",        null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_gpas", ["student_id"], name: "index_student_gpas_on_student_id"

  create_table "student_groups", force: :cascade do |t|
    t.integer  "student_id", null: false
    t.string   "key",        null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_groups", ["student_id"], name: "index_student_groups_on_student_id"

  create_table "students", force: :cascade do |t|
    t.integer  "uid"
    t.string   "login",       limit: 6,   null: false
    t.string   "lastname",    limit: 32
    t.string   "firstname",   limit: 32
    t.string   "picture",     limit: 128
    t.string   "location",    limit: 16
    t.integer  "promo"
    t.integer  "studentyear"
    t.integer  "credits"
    t.datetime "crawled_at"
  end

  add_index "students", ["login"], name: "index_students_on_login", unique: true

end

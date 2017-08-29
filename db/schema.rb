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

ActiveRecord::Schema.define(version: 20170825164841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "member_id"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_evaluations_on_member_id"
    t.index ["test_id", "member_id"], name: "index_evaluations_on_test_id_and_member_id", unique: true
    t.index ["test_id"], name: "index_evaluations_on_test_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "course_id"
    t.boolean "in_charge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "member_id"], name: "index_participations_on_course_id_and_member_id", unique: true
    t.index ["course_id"], name: "index_participations_on_course_id"
    t.index ["member_id"], name: "index_participations_on_member_id"
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_tests_on_course_id"
  end

  add_foreign_key "evaluations", "members"
  add_foreign_key "evaluations", "tests"
  add_foreign_key "participations", "courses"
  add_foreign_key "participations", "members"
  add_foreign_key "tests", "courses"
end

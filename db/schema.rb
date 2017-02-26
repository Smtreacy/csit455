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

ActiveRecord::Schema.define(version: 20170226205658) do

  create_table "books", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "author",     limit: 255
    t.string   "isbn",       limit: 50
    t.integer  "edition"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "books_for_classes", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "course_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_books_for_classes_on_book_id"
    t.index ["course_id"], name: "index_books_for_classes_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "teacher_id"
    t.string   "deptName",   limit: 7
    t.text     "name"
    t.integer  "section"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "media", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "author"
    t.integer  "edition"
    t.string   "isbn",       limit: 50
    t.string   "website",    limit: 255
    t.integer  "book_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["book_id"], name: "index_media_on_book_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "department",      limit: 7
    t.string   "name",            limit: 50
    t.string   "email",           limit: 50
    t.string   "password_digest", limit: 255
    t.boolean  "admin"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end

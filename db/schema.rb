# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_02_000126) do
  create_table "applications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "course_id"
    t.boolean "approved"
  end

  create_table "availabilities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.time "start_time"
    t.time "end_time"
    t.integer "day"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_number"
    t.string "subject"
    t.string "name"
    t.text "description"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "term"
    t.text "short_description"
    t.integer "graders"
    t.integer "graders_required"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "course_name"
    t.string "grade", limit: 1
  end

  create_table "recommendations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "instructor_id"
    t.integer "student_id"
    t.integer "section_id"
    t.text "comments"
  end

  create_table "sections", force: :cascade do |t|
    t.string "section_number"
    t.string "term"
    t.string "instructor"
    t.string "instruction_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.integer "student_id"
    t.string "days"
    t.time "start_time"
    t.time "end_time"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.boolean "is_approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "availabilities"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "courses"
  add_foreign_key "applications", "users"
  add_foreign_key "availabilities", "users"
  add_foreign_key "enrollments", "users"
  add_foreign_key "recommendations", "sections"
  add_foreign_key "recommendations", "users", column: "instructor_id"
  add_foreign_key "recommendations", "users", column: "student_id"
  add_foreign_key "sections", "courses"
  add_foreign_key "sections", "users", column: "student_id"
end

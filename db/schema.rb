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

ActiveRecord::Schema[7.0].define(version: 2023_07_15_160418) do
  create_table "courses", primary_key: "course_number", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.text "description"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", primary_key: "section_number", id: :string, force: :cascade do |t|
    t.string "course"
    t.string "term"
    t.string "campus"
    t.string "instructor"
    t.string "days_times"
    t.string "instruction_mode"
    t.integer "graders_required"
    t.integer "graders"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", primary_key: "email", id: :string, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.boolean "is_approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

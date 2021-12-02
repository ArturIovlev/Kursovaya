# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_23_123426) do

  create_table "programs", force: :cascade do |t|
    t.string "type"
    t.string "style"
    t.string "name"
    t.text "prog"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.string "type_of_prog"
    t.string "style"
    t.string "name"
    t.text "prog"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "prog1"
    t.text "prog2"
    t.text "prog3"
    t.text "prog4"
    t.text "prog5"
    t.text "prog6"
    t.integer "times_week"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.string "email"
    t.string "image"
    t.float "current_mass"
    t.boolean "allow_the_publication", default: false
    t.date "first_training"
    t.integer "training_id"
    t.integer "calories"
    t.float "weight_change"
    t.integer "num_of_trainings"
    t.integer "num_of_completed"
    t.integer "num_of_passes"
    t.boolean "skip", default: false
    t.date "date_of_change"
    t.boolean "updat", default: false
    t.date "date_of_update"
  end

end

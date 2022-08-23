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

ActiveRecord::Schema.define(version: 2022_08_23_044928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "user_id", null: false
    t.integer "point", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "psychology_test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["psychology_test_id"], name: "index_favorites_on_psychology_test_id"
    t.index ["user_id", "psychology_test_id"], name: "index_favorites_on_user_id_and_psychology_test_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "personalities", force: :cascade do |t|
    t.bigint "psychology_test_id", null: false
    t.string "name", limit: 30, null: false
    t.text "description", null: false
    t.integer "scoring_system", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["psychology_test_id"], name: "index_personalities_on_psychology_test_id"
  end

  create_table "psychology_tests", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.text "description", null: false
    t.text "referrer", null: false
    t.text "referrer_url"
    t.text "thumbnail"
    t.text "how_to_answer", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "title", null: false
    t.integer "choice_min_point", null: false
    t.integer "choice_max_point", null: false
    t.string "choice_min_word", limit: 30, null: false
    t.string "choice_max_word", limit: 30, null: false
    t.boolean "point_reversal", default: false, null: false
    t.bigint "personality_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["personality_id"], name: "index_questions_on_personality_id"
  end

  create_table "supplementary_informations", force: :cascade do |t|
    t.bigint "psychology_test_id", null: false
    t.string "site_name"
    t.string "site_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["psychology_test_id"], name: "index_supplementary_informations_on_psychology_test_id"
  end

  create_table "tests_categories", force: :cascade do |t|
    t.bigint "psychology_test_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["category_id"], name: "index_tests_categories_on_category_id"
    t.index ["psychology_test_id"], name: "index_tests_categories_on_psychology_test_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "avator"
    t.boolean "admin", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "favorites", "psychology_tests"
  add_foreign_key "favorites", "users"
  add_foreign_key "personalities", "psychology_tests"
  add_foreign_key "questions", "personalities"
  add_foreign_key "supplementary_informations", "psychology_tests"
  add_foreign_key "tests_categories", "categories"
  add_foreign_key "tests_categories", "psychology_tests"
end

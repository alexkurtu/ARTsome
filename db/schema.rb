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

ActiveRecord::Schema[7.0].define(version: 2023_02_04_153902) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arts", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.text "description"
    t.string "picture"
    t.string "artist"
    t.integer "year"
    t.string "current_location"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_arts_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "offer_date"
    t.float "price"
    t.integer "rent_type"
    t.date "start_date"
    t.date "end_date"
    t.string "shipping_address"
    t.bigint "user_id", null: false
    t.bigint "art_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_id"], name: "index_bookings_on_art_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "comment"
    t.bigint "user_id", null: false
    t.bigint "art_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_id"], name: "index_reviews_on_art_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "avatar"
    t.string "address"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "arts", "users"
  add_foreign_key "bookings", "arts"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "arts"
  add_foreign_key "reviews", "users"
end

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

ActiveRecord::Schema.define(version: 2019_05_28_033255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "price_paid"
    t.bigint "user_id"
    t.date "start_dt"
    t.date "end_dt"
    t.bigint "pokemon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_bookings_on_pokemon_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "category"
    t.string "photo"
    t.integer "level"
    t.string "address"
    t.float "price_per_day"
    t.integer "rating", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
    t.index ["user_id"], name: "index_pokemons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "phone_number"
    t.string "gender"
    t.string "profile_photo"
    t.boolean "is_owner", default: false
    t.integer "rating"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "pokemons"
  add_foreign_key "bookings", "users"
  add_foreign_key "pokemons", "users"
end

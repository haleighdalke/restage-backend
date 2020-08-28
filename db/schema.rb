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

ActiveRecord::Schema.define(version: 2020_08_28_191637) do

  create_table "admins", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "authorization_code"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "company_title"
    t.string "bio"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "festivals", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.string "title"
    t.string "description"
    t.string "cover_photo"
    t.string "application_start_date"
    t.string "application_end_date"
    t.string "release_date"
    t.string "video_list"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_festivals_on_admin_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "festival_id", null: false
    t.string "title"
    t.string "cover_photo"
    t.string "description"
    t.string "trailer_id"
    t.string "full_video_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_pieces_on_artist_id"
    t.index ["festival_id"], name: "index_pieces_on_festival_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "admins", "users"
  add_foreign_key "artists", "users"
  add_foreign_key "festivals", "admins"
  add_foreign_key "pieces", "artists"
  add_foreign_key "pieces", "festivals"
end

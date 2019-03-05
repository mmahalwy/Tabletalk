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

ActiveRecord::Schema.define(version: 2019_03_05_050108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.bigint "timeslot_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timeslot_id"], name: "index_availabilities_on_timeslot_id"
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "state", default: "", null: false
    t.string "country", default: "", null: false
    t.boolean "enabled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enabled"], name: "index_cities_on_enabled"
    t.index ["name"], name: "index_cities_on_name"
  end

  create_table "confirmations", force: :cascade do |t|
    t.bigint "week_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_confirmations_on_user_id"
    t.index ["week_id"], name: "index_confirmations_on_week_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "address", default: "", null: false
    t.string "google_place_id", default: ""
    t.json "google_address", default: "{}"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_locations_on_city_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.bigint "week_id"
    t.bigint "timeslot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timeslot_id"], name: "index_meetings_on_timeslot_id"
    t.index ["week_id"], name: "index_meetings_on_week_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "timeslots", force: :cascade do |t|
    t.string "day_of_week"
    t.string "time_of_day"
    t.boolean "enabled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_of_week"], name: "index_timeslots_on_day_of_week"
    t.index ["enabled"], name: "index_timeslots_on_enabled"
    t.index ["time_of_day"], name: "index_timeslots_on_time_of_day"
  end

  create_table "user_meetings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "meeting_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_user_meetings_on_meeting_id"
    t.index ["rating"], name: "index_user_meetings_on_rating"
    t.index ["user_id"], name: "index_user_meetings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "uid", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "image", default: "", null: false
    t.string "title", default: "", null: false
    t.text "description1", default: "", null: false
    t.text "description2", default: "", null: false
    t.text "description3", default: "", null: false
    t.json "location", default: "", null: false
    t.string "profile_url", default: "", null: false
    t.string "location_name", default: "", null: false
    t.string "email_token", default: "", null: false
    t.string "token"
    t.integer "expires_at"
    t.boolean "approved", default: false, null: false
    t.integer "city_id"
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["email_token"], name: "index_users_on_email_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.date "date_from"
    t.date "date_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date_from"], name: "index_weeks_on_date_from"
    t.index ["date_to"], name: "index_weeks_on_date_to"
  end

  add_foreign_key "availabilities", "timeslots"
  add_foreign_key "availabilities", "users"
  add_foreign_key "confirmations", "users"
  add_foreign_key "confirmations", "weeks"
  add_foreign_key "locations", "cities"
  add_foreign_key "meetings", "timeslots"
  add_foreign_key "meetings", "weeks"
  add_foreign_key "user_meetings", "meetings"
  add_foreign_key "user_meetings", "users"
end

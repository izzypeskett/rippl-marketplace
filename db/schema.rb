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

ActiveRecord::Schema.define(version: 2019_10_31_054510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "number"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "address_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_agencies_on_address_id"
    t.index ["user_id"], name: "index_agencies_on_user_id"
  end

  create_table "listing_outcomes", force: :cascade do |t|
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listing_volunteers", force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "volunteer_id"
    t.bigint "listing_outcome_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_listing_volunteers_on_listing_id"
    t.index ["listing_outcome_id"], name: "index_listing_volunteers_on_listing_outcome_id"
    t.index ["volunteer_id"], name: "index_listing_volunteers_on_volunteer_id"
  end

  create_table "listings", force: :cascade do |t|
    t.text "title"
    t.bigint "address_id"
    t.string "time_frame"
    t.integer "no_of_volunteers"
    t.bigint "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "time_required"
    t.text "description"
    t.index ["address_id"], name: "index_listings_on_address_id"
    t.index ["agency_id"], name: "index_listings_on_agency_id"
  end

  create_table "listings_skills", id: false, force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "skill_id", null: false
    t.index ["listing_id", "skill_id"], name: "index_listings_skills_on_listing_id_and_skill_id"
    t.index ["skill_id", "listing_id"], name: "index_listings_skills_on_skill_id_and_listing_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills_volunteers", id: false, force: :cascade do |t|
    t.bigint "volunteer_id", null: false
    t.bigint "skill_id", null: false
    t.index ["skill_id", "volunteer_id"], name: "index_skills_volunteers_on_skill_id_and_volunteer_id"
    t.index ["volunteer_id", "skill_id"], name: "index_skills_volunteers_on_volunteer_id_and_skill_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_agency", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "name"
    t.text "photo"
    t.integer "age"
    t.integer "gender"
    t.text "resume"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_volunteers_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agencies", "addresses"
  add_foreign_key "agencies", "users"
  add_foreign_key "listing_volunteers", "listing_outcomes"
  add_foreign_key "listing_volunteers", "listings"
  add_foreign_key "listing_volunteers", "volunteers"
  add_foreign_key "listings", "addresses"
  add_foreign_key "listings", "agencies"
  add_foreign_key "volunteers", "users"
end

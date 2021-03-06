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

ActiveRecord::Schema.define(version: 2019_12_04_213849) do

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

  create_table "comics", force: :cascade do |t|
    t.string "title"
    t.integer "issue_number"
    t.text "description"
    t.string "comic_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "series_id"
    t.bigint "user_id"
    t.index ["series_id"], name: "index_comics_on_series_id"
    t.index ["user_id"], name: "index_comics_on_user_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "comic_id"
    t.bigint "series_id"
    t.bigint "review_id"
    t.index ["comic_id"], name: "index_discussions_on_comic_id"
    t.index ["review_id"], name: "index_discussions_on_review_id"
    t.index ["series_id"], name: "index_discussions_on_series_id"
  end

  create_table "pages", force: :cascade do |t|
    t.integer "page_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "comic_id"
    t.index ["comic_id"], name: "index_pages_on_comic_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "discussion_id"
    t.bigint "user_id"
    t.index ["discussion_id"], name: "index_posts_on_discussion_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reccomendations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "comic_id"
    t.index ["comic_id"], name: "index_reccomendations_on_comic_id"
    t.index ["user_id"], name: "index_reccomendations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "comic_id"
    t.bigint "series_id"
    t.bigint "user_id"
    t.index ["comic_id"], name: "index_reviews_on_comic_id"
    t.index ["series_id"], name: "index_reviews_on_series_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_series_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "welcomes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_welcomes_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comics", "series"
  add_foreign_key "comics", "users"
  add_foreign_key "discussions", "comics"
  add_foreign_key "discussions", "reviews"
  add_foreign_key "discussions", "series"
  add_foreign_key "pages", "comics"
  add_foreign_key "posts", "discussions"
  add_foreign_key "reccomendations", "comics"
  add_foreign_key "reccomendations", "users"
  add_foreign_key "reviews", "comics"
  add_foreign_key "reviews", "series"
  add_foreign_key "reviews", "users"
  add_foreign_key "series", "users"
end

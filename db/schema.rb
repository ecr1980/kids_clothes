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

ActiveRecord::Schema[7.0].define(version: 2022_11_18_190605) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "children", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "short_sleeve_shirt_need"
    t.integer "long_sleeve_shirt_need"
    t.integer "shorts_need"
    t.integer "jean_pants_need"
    t.integer "non_jean_pants_need"
    t.integer "short_skirt_need"
    t.integer "long_skirt_need"
    t.integer "short_dress_need"
    t.integer "long_dress_need"
    t.integer "warm_pj_shirt_need"
    t.integer "warm_pj_pants_need"
    t.integer "warm_pj_onesie_need"
    t.integer "cool_pj_shirt_need"
    t.integer "cool_pj_pants_need"
    t.integer "cool_pj_onesie_need"
    t.integer "nightgown_need"
    t.integer "underwear_need"
    t.integer "socks_need"
    t.integer "winter_coat_need"
    t.integer "snow_suit_need"
    t.integer "fall_coat_need"
    t.integer "rain_coat_need"
    t.integer "winter_hat_need"
    t.integer "non_winter_hat_need"
    t.integer "gloves_need"
    t.integer "mittens_need"
    t.integer "dress_shoes_need"
    t.integer "tennis_shoes_need"
    t.integer "boot_need"
    t.integer "snow_boot_need"
    t.integer "rain_boot_need"
    t.integer "suit_jacket_need"
    t.string "nickname"
    t.integer "short_sleeve_shirt_size"
    t.integer "long_sleeve_shirt_size"
    t.integer "shorts_size"
    t.integer "jean_pants_size"
    t.integer "non_jean_pants_size"
    t.integer "short_skirt_size"
    t.integer "long_skirt_size"
    t.integer "short_dress_size"
    t.integer "long_dress_size"
    t.integer "warm_pj_shirt_size"
    t.integer "warm_pj_pants_size"
    t.integer "warm_pj_onesie_size"
    t.integer "cool_pj_shirt_size"
    t.integer "cool_pj_pants_size"
    t.integer "cool_pj_onesie_size"
    t.integer "nightgown_size"
    t.integer "underwear_size"
    t.integer "socks_size"
    t.integer "winter_coat_size"
    t.integer "snow_suit_size"
    t.integer "fall_coat_size"
    t.integer "rain_coat_size"
    t.integer "winter_hat_size"
    t.integer "non_winter_hat_size"
    t.integer "gloves_size"
    t.integer "mittens_size"
    t.integer "dress_shoes_size"
    t.integer "tennis_shoes_size"
    t.integer "boot_size"
    t.integer "snow_boot_size"
    t.integer "rain_boot_size"
    t.integer "suit_jacket_size"
  end

  create_table "garments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "clothing_catagory"
    t.string "clothing_catagory_item"
    t.string "color"
    t.string "season"
    t.boolean "on_market"
    t.float "price"
    t.integer "size"
    t.integer "child_id"
    t.integer "market_id"
  end

  create_table "markets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
  end

  create_table "user_children", force: :cascade do |t|
    t.bigint "child_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_user_children_on_child_id"
    t.index ["user_id"], name: "index_user_children_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end

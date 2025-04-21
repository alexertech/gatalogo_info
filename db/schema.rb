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

ActiveRecord::Schema[7.2].define(version: 2025_04_21_174312) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "vector"

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

  create_table "events", force: :cascade do |t|
    t.string "event_type"
    t.bigint "user_id"
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.jsonb "metadata", default: {}
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_events_on_created_at"
    t.index ["event_type", "created_at"], name: "index_events_on_event_type_and_created_at"
    t.index ["event_type"], name: "index_events_on_event_type"
    t.index ["trackable_type", "trackable_id", "created_at"], name: "index_events_on_trackable_type_and_trackable_id_and_created_at"
    t.index ["trackable_type", "trackable_id"], name: "index_events_on_trackable"
    t.index ["user_id", "created_at"], name: "index_events_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "gatos", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.text "description"
    t.string "image"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_gatos_on_user_id"
  end

  create_table "gatos_tags", id: false, force: :cascade do |t|
    t.bigint "gato_id", null: false
    t.bigint "tag_id", null: false
    t.index ["gato_id", "tag_id"], name: "index_gatos_tags_on_gato_id_and_tag_id"
    t.index ["tag_id", "gato_id"], name: "index_gatos_tags_on_tag_id_and_gato_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "users"
  add_foreign_key "gatos", "users"
end

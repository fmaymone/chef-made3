# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161006171750) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "kind"
    t.integer  "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "menu_id"
  end

  add_index "documents", ["menu_id"], name: "index_documents_on_menu_id"
  add_index "documents", ["user_id"], name: "index_documents_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "event_type"
    t.integer  "number_people"
    t.datetime "date_event"
    t.string   "event_name"
    t.text     "summary"
    t.string   "address"
    t.boolean  "is_public"
    t.integer  "price"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "menu_pictures", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "kind"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "menu_pictures", ["menu_id"], name: "index_menu_pictures_on_menu_id"

  create_table "menu_tags", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "menu_tags", ["menu_id"], name: "index_menu_tags_on_menu_id"
  add_index "menu_tags", ["tag_id"], name: "index_menu_tags_on_tag_id"

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.text     "description"
    t.string   "title"
    t.decimal  "people"
    t.integer  "duration"
    t.string   "entrada"
    t.string   "principal"
    t.string   "sobremesa"
    t.integer  "price",       default: 0, null: false
  end

  add_index "menus", ["user_id"], name: "index_menus_on_user_id"

  create_table "menus_tags", id: false, force: :cascade do |t|
    t.integer "menu_id"
    t.integer "tag_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "room_id"
    t.integer  "kind",               default: 0
    t.integer  "user_id"
  end

  add_index "photos", ["event_id"], name: "index_photos_on_event_id"
  add_index "photos", ["user_id"], name: "index_photos_on_user_id"

  create_table "plans", force: :cascade do |t|
    t.integer  "kind"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "value"
    t.boolean  "isRenewable"
    t.string   "title"
    t.integer  "user_id"
  end

  add_index "plans", ["user_id"], name: "index_plans_on_user_id"

  create_table "professionals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description"
    t.integer  "status"
    t.integer  "rg"
    t.integer  "cpf"
    t.boolean  "is_ficha_antecedentes"
    t.boolean  "is_rg"
    t.boolean  "is_cpf"
    t.string   "adress"
    t.text     "mini_curriculo"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "professionals", ["user_id"], name: "index_professionals_on_user_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "price"
    t.integer  "total"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "reservable_id"
    t.string   "reservable_type"
  end

  add_index "reservations", ["event_id"], name: "index_reservations_on_event_id"
  add_index "reservations", ["reservable_id"], name: "index_reservations_on_reservable_id"
  add_index "reservations", ["reservable_type"], name: "index_reservations_on_reservable_type"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "star",       default: 1
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "reviews", ["room_id"], name: "index_reviews_on_room_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "rooms", force: :cascade do |t|
    t.string   "home_type"
    t.string   "room_type"
    t.integer  "accommodate"
    t.integer  "bed_room"
    t.integer  "bath_room"
    t.string   "listing_name"
    t.text     "summary"
    t.string   "address"
    t.boolean  "is_tv"
    t.boolean  "is_kitchen"
    t.boolean  "is_air"
    t.boolean  "is_heating"
    t.boolean  "is_internet"
    t.integer  "price"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "fullname"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "phone_number"
    t.text     "description"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.integer  "plan_id"
    t.string   "cpf",                    limit: 8
    t.string   "rg",                     limit: 8
    t.boolean  "isFichaAntecedentes"
    t.boolean  "isRg"
    t.boolean  "isCpf"
    t.text     "miniCurriculo"
    t.integer  "status",                           default: 0
    t.integer  "photo_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["photo_id"], name: "index_users_on_photo_id"
  add_index "users", ["plan_id"], name: "index_users_on_plan_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

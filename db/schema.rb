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

ActiveRecord::Schema.define(version: 20180101071612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "fuzzystrmatch"

  create_table "app_users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_records", force: :cascade do |t|
    t.text "contact_id"
    t.text "master_id"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "contact_firstname"
    t.string "contact_lastname"
    t.string "contact_email"
    t.string "birthday"
    t.string "displayname"
    t.string "initials"
    t.string "middlename"
    t.string "nickname"
    t.string "title"
    t.string "generation"
    t.string "companyname"
    t.string "department"
    t.string "officelocation"
    t.string "profession"
    t.string "businesshomepage"
    t.string "assistantname"
    t.string "manager"
    t.string "homephones"
    t.string "mobilephone"
    t.string "businessphones"
    t.string "homeaddress"
    t.string "businessaddress"
    t.string "otheraddress"
    t.string "outlook_user_id"
    t.string "visibility", default: "true"
    t.string "lastmodifieddatetime"
    t.string "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_contacts", force: :cascade do |t|
    t.string "contact_firstname"
    t.string "contact_lastname"
    t.string "contact_email"
    t.string "birthday"
    t.string "displayname"
    t.string "initials"
    t.string "middlename"
    t.string "nickname"
    t.string "title"
    t.string "generation"
    t.string "companyname"
    t.string "department"
    t.string "officelocation"
    t.string "profession"
    t.string "businesshomepage"
    t.string "assistantname"
    t.string "manager"
    t.string "homephones"
    t.string "mobilephone"
    t.string "businessphones"
    t.string "homeaddress"
    t.string "businessaddress"
    t.string "otheraddress"
    t.string "outlook_user_id"
    t.string "visibility", default: "PUBLIC"
    t.string "lastmodifieddatetime"
    t.string "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "firstname"
    t.string "lastname"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

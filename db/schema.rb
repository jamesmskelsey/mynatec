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

ActiveRecord::Schema.define(version: 2018_07_04_031721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "entries", force: :cascade do |t|
    t.string "pub_number"
    t.string "copy_number"
    t.string "work_center"
    t.string "pub_type"
    t.string "classification"
    t.string "title"
    t.datetime "issue_date"
    t.datetime "last_audit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "library_id"
  end

  create_table "excerpts", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "page_number"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.string "account"
    t.string "maintenance_level"
    t.string "uic"
    t.string "attn"
    t.string "activity"
    t.string "address"
    t.string "city_state_zip"
    t.string "poc_name"
    t.string "poc_phone"
    t.string "poc_email"
    t.string "lead_ctpl"
    t.string "alt_ctpl"
    t.string "qa_monitor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "part_numbers", force: :cascade do |t|
    t.string "number"
    t.string "niin"
    t.integer "publication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "maintenance_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "path"
    t.string "pub_number"
    t.index ["title"], name: "index_publications_on_title"
  end

end

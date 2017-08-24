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

ActiveRecord::Schema.define(version: 20170823132023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "topics_count", default: 0, null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "topics_count", default: 0, null: false
  end

  create_table "tags_topics", id: false, force: :cascade do |t|
    t.integer "topic_id"
    t.integer "tag_id"
    t.index ["tag_id"], name: "index_tags_topics_on_tag_id"
    t.index ["topic_id"], name: "index_tags_topics_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title", null: false
    t.string "summary"
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "read_count", default: 0
    t.string "tag"
    t.integer "category_id", default: 1, null: false
  end

  create_table "topics_tags", id: false, force: :cascade do |t|
    t.integer "topic_id"
    t.integer "tag_id"
    t.index ["tag_id"], name: "index_topics_tags_on_tag_id"
    t.index ["topic_id"], name: "index_topics_tags_on_topic_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "qq"
    t.string "email_md5"
    t.string "password_digest"
    t.string "avatar"
  end

end

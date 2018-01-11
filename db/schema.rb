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

ActiveRecord::Schema.define(version: 20180111013821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "topics_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "topic_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "to_comment_id"
    t.integer "like_counts"
  end

  create_table "friend_links", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comment_id"
    t.boolean "liked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "limits", force: :cascade do |t|
    t.integer "admin_id"
    t.string "to_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

  create_table "notices", force: :cascade do |t|
    t.text "content"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "to_user"
  end

  create_table "replies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comment_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "digest"
    t.integer "user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.integer "manages_per_page_count", default: 10
    t.integer "category_list_count", default: 10
    t.integer "comment_list_count", default: 10
    t.integer "read_rank_list_count", default: 10
    t.boolean "comment", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "tag_count", default: 10
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.text "body", null: false
    t.integer "user_id"
    t.integer "read_count", default: 0
    t.string "tag"
    t.integer "category_id", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "sex"
    t.text "summary"
    t.date "birthday"
    t.string "address"
    t.string "marital_status"
    t.string "degree"
    t.string "position"
    t.string "tel"
    t.string "nickname"
  end

end

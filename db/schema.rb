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

ActiveRecord::Schema.define(version: 2020_01_20_044131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_tag_relations", id: :serial, force: :cascade do |t|
    t.integer "blog_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blog_tag_relations_on_blog_id"
    t.index ["tag_id"], name: "index_blog_tag_relations_on_tag_id"
  end

  create_table "blogs", id: :serial, force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.string "title"
    t.index ["user_id", "created_at"], name: "index_blogs_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "blog_id"
    t.string "name"
    t.string "title"
    t.string "mail"
    t.string "url"
    t.string "password"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
  end

  create_table "relationships", id: :serial, force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "activation_digest"
    t.string "image"
    t.string "introduction"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "blog_tag_relations", "blogs"
  add_foreign_key "blog_tag_relations", "tags"
  add_foreign_key "blogs", "users"
  add_foreign_key "comments", "blogs"
end

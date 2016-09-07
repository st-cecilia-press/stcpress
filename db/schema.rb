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

ActiveRecord::Schema.define(version: 20160906210957) do

  create_table "book_contents", force: :cascade do |t|
    t.integer  "piece_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "book_contents", ["book_id"], name: "index_book_contents_on_book_id"
  add_index "book_contents", ["piece_id"], name: "index_book_contents_on_piece_id"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "composers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer "book_content_id"
    t.integer "manuscript_content_id"
    t.string  "name"
    t.string  "description"
    t.string  "url"
    t.string  "filename"
  end

  add_index "images", ["book_content_id"], name: "index_images_on_book_content_id"
  add_index "images", ["manuscript_content_id"], name: "index_images_on_manuscript_content_id"

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manuscript_contents", force: :cascade do |t|
    t.integer  "manuscript_id"
    t.integer  "piece_id"
    t.string   "position"
    t.integer  "diamm"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "manuscript_contents", ["manuscript_id"], name: "index_manuscript_contents_on_manuscript_id"
  add_index "manuscript_contents", ["piece_id"], name: "index_manuscript_contents_on_piece_id"

  create_table "manuscripts", force: :cascade do |t|
    t.string   "name"
    t.string   "archive"
    t.string   "shelfmark"
    t.integer  "diamm"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  create_table "piece_languages", force: :cascade do |t|
    t.integer  "language_id"
    t.integer  "piece_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "piece_languages", ["language_id"], name: "index_piece_languages_on_language_id"
  add_index "piece_languages", ["piece_id"], name: "index_piece_languages_on_piece_id"

  create_table "pieces", force: :cascade do |t|
    t.string   "title"
    t.integer  "composer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  add_index "pieces", ["composer_id"], name: "index_pieces_on_composer_id"

  create_table "publicationships", force: :cascade do |t|
    t.integer  "piece_id"
    t.integer  "repository_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "publicationships", ["piece_id"], name: "index_publicationships_on_piece_id"
  add_index "publicationships", ["repository_id"], name: "index_publicationships_on_repository_id"

  create_table "repositories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
  end

  create_table "song_voicings", force: :cascade do |t|
    t.integer  "voicing_id"
    t.integer  "piece_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "song_voicings", ["piece_id"], name: "index_song_voicings_on_piece_id"
  add_index "song_voicings", ["voicing_id"], name: "index_song_voicings_on_voicing_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "piece_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["piece_id"], name: "index_taggings_on_piece_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "voicings", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

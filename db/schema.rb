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

ActiveRecord::Schema.define(version: 20170610143602) do

  create_table "audio_recordings", force: :cascade do |t|
    t.integer  "ensemble_id"
    t.string   "purchase_url"
    t.string   "youtube"
    t.string   "file"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
  end

  add_index "audio_recordings", ["ensemble_id"], name: "index_audio_recordings_on_ensemble_id"

  create_table "book_contents", force: :cascade do |t|
    t.integer  "piece_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order"
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

  create_table "dance_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dance_facsimile_images", force: :cascade do |t|
    t.string   "url"
    t.string   "filename"
    t.string   "description"
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "dance_source_content_id"
  end

  add_index "dance_facsimile_images", ["dance_source_content_id"], name: "index_dance_facsimile_images_on_dance_source_content_id"

  create_table "dance_source_contents", force: :cascade do |t|
    t.integer  "dance_id"
    t.integer  "dance_source_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "dance_source_contents", ["dance_id"], name: "index_dance_source_contents_on_dance_id"
  add_index "dance_source_contents", ["dance_source_id"], name: "index_dance_source_contents_on_dance_source_id"

  create_table "dance_sources", force: :cascade do |t|
    t.integer  "start_date"
    t.integer  "end_date"
    t.string   "name"
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dance_translations", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "dance_source_content_id"
  end

  add_index "dance_translations", ["dance_source_content_id"], name: "index_dance_translations_on_dance_source_content_id"

  create_table "dances", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "dance_category_id"
    t.integer  "person_id"
  end

  add_index "dances", ["dance_category_id"], name: "index_dances_on_dance_category_id"
  add_index "dances", ["person_id"], name: "index_dances_on_person_id"

  create_table "ensembles", force: :cascade do |t|
    t.text     "description"
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "facsimile_sources", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "manuscript_id"
    t.integer  "book_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "facsimile_sources", ["book_id"], name: "index_facsimile_sources_on_book_id"
  add_index "facsimile_sources", ["manuscript_id"], name: "index_facsimile_sources_on_manuscript_id"

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

  create_table "instruction_audios", force: :cascade do |t|
    t.integer  "audio_recording_id"
    t.integer  "instruction_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "instruction_audios", ["audio_recording_id"], name: "index_instruction_audios_on_audio_recording_id"
  add_index "instruction_audios", ["instruction_id"], name: "index_instruction_audios_on_instruction_id"

  create_table "instruction_sheetmusics", force: :cascade do |t|
    t.integer  "sheet_music_id"
    t.integer  "instruction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "instruction_sheetmusics", ["instruction_id"], name: "index_instruction_sheetmusics_on_instruction_id"
  add_index "instruction_sheetmusics", ["sheet_music_id"], name: "index_instruction_sheetmusics_on_sheet_music_id"

  create_table "instruction_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructions", force: :cascade do |t|
    t.text     "text"
    t.integer  "dance_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "person_id"
    t.integer  "instruction_type_id"
  end

  add_index "instructions", ["dance_id"], name: "index_instructions_on_dance_id"
  add_index "instructions", ["instruction_type_id"], name: "index_instructions_on_instruction_type_id"
  add_index "instructions", ["person_id"], name: "index_instructions_on_person_id"

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
    t.integer  "order"
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

  create_table "music_files", force: :cascade do |t|
    t.string   "filename"
    t.string   "source"
    t.string   "name"
    t.integer  "sheet_music_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "music_files", ["sheet_music_id"], name: "index_music_files_on_sheet_music_id"

  create_table "pages", force: :cascade do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer  "start_date"
    t.integer  "end_date"
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
    t.string   "slug"
  end

  create_table "sheet_musics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.string   "name"
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

  create_table "users", force: :cascade do |t|
    t.string   "name"
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
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "video_recordings", force: :cascade do |t|
    t.string   "name"
    t.string   "youtube"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "instruction_id"
  end

  add_index "video_recordings", ["instruction_id"], name: "index_video_recordings_on_instruction_id"

  create_table "voicings", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

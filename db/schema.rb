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

ActiveRecord::Schema.define(version: 2020_10_09_165630) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audio_recordings", force: :cascade do |t|
    t.integer "ensemble_id"
    t.string "purchase_url"
    t.string "youtube"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["ensemble_id"], name: "index_audio_recordings_on_ensemble_id"
  end

  create_table "book_contents", force: :cascade do |t|
    t.integer "piece_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["book_id"], name: "index_book_contents_on_book_id"
    t.index ["piece_id"], name: "index_book_contents_on_piece_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "composers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dance_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dance_facsimile_images", force: :cascade do |t|
    t.string "url"
    t.string "filename"
    t.string "description"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dance_source_content_id"
    t.index ["dance_source_content_id"], name: "index_dance_facsimile_images_on_dance_source_content_id"
  end

  create_table "dance_source_contents", force: :cascade do |t|
    t.integer "dance_id"
    t.integer "dance_source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dance_id"], name: "index_dance_source_contents_on_dance_id"
    t.index ["dance_source_id"], name: "index_dance_source_contents_on_dance_source_id"
  end

  create_table "dance_sources", force: :cascade do |t|
    t.integer "start_date"
    t.integer "end_date"
    t.string "name"
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dance_translations", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dance_source_content_id"
    t.index ["dance_source_content_id"], name: "index_dance_translations_on_dance_source_content_id"
  end

  create_table "dances", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dance_category_id"
    t.integer "person_id"
    t.index ["dance_category_id"], name: "index_dances_on_dance_category_id"
    t.index ["person_id"], name: "index_dances_on_person_id"
  end

  create_table "ensembles", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facsimile_sources", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.integer "manuscript_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_facsimile_sources_on_book_id"
    t.index ["manuscript_id"], name: "index_facsimile_sources_on_manuscript_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "book_content_id"
    t.integer "manuscript_content_id"
    t.string "name"
    t.string "description"
    t.string "url"
    t.string "filename"
    t.index ["book_content_id"], name: "index_images_on_book_content_id"
    t.index ["manuscript_content_id"], name: "index_images_on_manuscript_content_id"
  end

  create_table "instruction_audios", force: :cascade do |t|
    t.integer "audio_recording_id"
    t.integer "instruction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audio_recording_id"], name: "index_instruction_audios_on_audio_recording_id"
    t.index ["instruction_id"], name: "index_instruction_audios_on_instruction_id"
  end

  create_table "instruction_sheetmusics", force: :cascade do |t|
    t.integer "sheet_music_id"
    t.integer "instruction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instruction_id"], name: "index_instruction_sheetmusics_on_instruction_id"
    t.index ["sheet_music_id"], name: "index_instruction_sheetmusics_on_sheet_music_id"
  end

  create_table "instruction_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructions", force: :cascade do |t|
    t.text "text"
    t.integer "dance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_id"
    t.integer "instruction_type_id"
    t.index ["dance_id"], name: "index_instructions_on_dance_id"
    t.index ["instruction_type_id"], name: "index_instructions_on_instruction_type_id"
    t.index ["person_id"], name: "index_instructions_on_person_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manuscript_contents", force: :cascade do |t|
    t.integer "manuscript_id"
    t.integer "piece_id"
    t.string "position"
    t.integer "diamm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["manuscript_id"], name: "index_manuscript_contents_on_manuscript_id"
    t.index ["piece_id"], name: "index_manuscript_contents_on_piece_id"
  end

  create_table "manuscripts", force: :cascade do |t|
    t.string "name"
    t.string "archive"
    t.string "shelfmark"
    t.integer "diamm"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "music_files", force: :cascade do |t|
    t.string "filename"
    t.string "source"
    t.string "name"
    t.integer "sheet_music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_music_id"], name: "index_music_files_on_sheet_music_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "piece_languages", force: :cascade do |t|
    t.integer "language_id"
    t.integer "piece_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_piece_languages_on_language_id"
    t.index ["piece_id"], name: "index_piece_languages_on_piece_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "title"
    t.integer "composer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "start_date"
    t.integer "end_date"
    t.index ["composer_id"], name: "index_pieces_on_composer_id"
  end

  create_table "publicationships", force: :cascade do |t|
    t.integer "piece_id"
    t.integer "repository_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_publicationships_on_piece_id"
    t.index ["repository_id"], name: "index_publicationships_on_repository_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "slug"
    t.string "commit"
  end

  create_table "sheet_musics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "name"
  end

  create_table "song_voicings", force: :cascade do |t|
    t.integer "voicing_id"
    t.integer "piece_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_song_voicings_on_piece_id"
    t.index ["voicing_id"], name: "index_song_voicings_on_voicing_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "piece_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_taggings_on_piece_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_recordings", force: :cascade do |t|
    t.string "name"
    t.string "youtube"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "instruction_id"
    t.index ["instruction_id"], name: "index_video_recordings_on_instruction_id"
  end

  create_table "voicings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

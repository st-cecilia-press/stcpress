class CreateMusicFiles < ActiveRecord::Migration
  def change
    create_table :music_files do |t|
      t.string :filename
      t.string :source
      t.string :name
      t.references :sheet_music, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

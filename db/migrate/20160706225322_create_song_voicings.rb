class CreateSongVoicings < ActiveRecord::Migration
  def change
    create_table :song_voicings do |t|
      t.references :voicing, index: true, foreign_key: true
      t.references :piece, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

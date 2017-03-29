class CreateAudioRecordings < ActiveRecord::Migration
  def change
    create_table :audio_recordings do |t|
      t.references :ensemble, index: true, foreign_key: true
      t.string :purchase_url
      t.string :youtube
      t.string :file

      t.timestamps null: false
    end
  end
end

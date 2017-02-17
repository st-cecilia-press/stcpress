class CreateInstructionAudios < ActiveRecord::Migration
  def change
    create_table :instruction_audios do |t|
      t.references :audio_recording, index: true, foreign_key: true
      t.references :instruction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

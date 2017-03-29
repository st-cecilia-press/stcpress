class CreateInstructionSheetmusics < ActiveRecord::Migration
  def change
    create_table :instruction_sheetmusics do |t|
      t.references :sheet_music, index: true, foreign_key: true
      t.references :instruction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateManuscriptContents < ActiveRecord::Migration
  def change
    create_table :manuscript_contents do |t|
      t.references :manuscript, index: true, foreign_key: true
      t.references :piece, index: true, foreign_key: true
      t.string :position
      t.integer :diamm

      t.timestamps null: false
    end
  end
end

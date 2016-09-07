class CreatePieceLanguages < ActiveRecord::Migration
  def change
    create_table :piece_languages do |t|
      t.references :language, index: true, foreign_key: true
      t.references :piece, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

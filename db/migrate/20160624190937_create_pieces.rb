class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.references :composer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.text :text
      t.references :dance, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

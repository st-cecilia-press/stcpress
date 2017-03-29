class CreateDanceSourceContents < ActiveRecord::Migration
  def change
    create_table :dance_source_contents do |t|
      t.references :dance, index: true, foreign_key: true
      t.references :dance_source, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

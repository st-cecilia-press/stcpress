class CreateFacsimileSources < ActiveRecord::Migration
  def change
    create_table :facsimile_sources do |t|
      t.string :name
      t.string :url
      t.references :manuscript, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

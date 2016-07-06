class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :book_content, index: true, foreign_key: true
      t.references :manuscript_content, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.string :url
      t.string :filename
    end
  end
end

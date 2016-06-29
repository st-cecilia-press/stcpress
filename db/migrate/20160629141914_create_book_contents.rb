class CreateBookContents < ActiveRecord::Migration
  def change
    create_table :book_contents do |t|
      t.references :piece, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

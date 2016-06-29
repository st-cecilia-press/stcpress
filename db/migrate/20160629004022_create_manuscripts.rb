class CreateManuscripts < ActiveRecord::Migration
  def change
    create_table :manuscripts do |t|
      t.string :name
      t.string :archive
      t.string :shelfmark
      t.integer :diamm
      t.string :description

      t.timestamps null: false
    end
  end
end

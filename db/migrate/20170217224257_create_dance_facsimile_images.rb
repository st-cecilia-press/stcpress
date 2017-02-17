class CreateDanceFacsimileImages < ActiveRecord::Migration
  def change
    create_table :dance_facsimile_images do |t|
      t.string :url
      t.string :filename
      t.string :description
      t.string :name

      t.timestamps null: false
    end
  end
end

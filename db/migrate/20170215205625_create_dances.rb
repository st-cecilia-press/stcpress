class CreateDances < ActiveRecord::Migration
  def change
    create_table :dances do |t|
      t.string :title
      t.string :slug
      t.timestamps null: false
    end
  end
end

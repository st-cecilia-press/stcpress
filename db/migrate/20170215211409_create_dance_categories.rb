class CreateDanceCategories < ActiveRecord::Migration
  def change
    create_table :dance_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

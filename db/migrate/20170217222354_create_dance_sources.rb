class CreateDanceSources < ActiveRecord::Migration
  def change
    create_table :dance_sources do |t|
      t.integer :start_date
      t.integer :end_date
      t.string :name
      t.string :title
      t.string :slug

      t.timestamps null: false
    end
  end
end

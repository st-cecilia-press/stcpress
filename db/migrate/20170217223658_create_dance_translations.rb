class CreateDanceTranslations < ActiveRecord::Migration
  def change
    create_table :dance_translations do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end

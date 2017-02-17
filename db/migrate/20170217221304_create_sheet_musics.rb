class CreateSheetMusics < ActiveRecord::Migration
  def change
    create_table :sheet_musics do |t|

      t.timestamps null: false
    end
  end
end

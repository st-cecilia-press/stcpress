class AddNameToSheetMusic < ActiveRecord::Migration
  def change
    add_column :sheet_musics, :name, :string
  end
end

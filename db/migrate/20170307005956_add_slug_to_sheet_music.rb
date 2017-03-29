class AddSlugToSheetMusic < ActiveRecord::Migration
  def change
    add_column :sheet_musics, :slug, :string
  end
end

class AddSlugToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :slug, :string
  end
end

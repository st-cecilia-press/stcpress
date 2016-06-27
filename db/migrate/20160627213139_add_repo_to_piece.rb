class AddRepoToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :repo, :string
  end
end

class RemoveRepoFromPiece < ActiveRecord::Migration
  def change
    remove_column :pieces, :repo, :string
  end
end

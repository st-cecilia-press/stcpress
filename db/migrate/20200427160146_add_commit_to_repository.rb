class AddCommitToRepository < ActiveRecord::Migration[5.2]
  def change
    add_column :repositories, :commit, :string
  end
end

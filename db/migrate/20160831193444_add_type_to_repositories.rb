class AddTypeToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :type, :string
  end
end

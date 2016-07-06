class AddSlugToManuscript < ActiveRecord::Migration
  def change
    add_column :manuscripts, :slug, :string
  end
end

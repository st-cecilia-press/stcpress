class AddOrderToManuscriptContent < ActiveRecord::Migration
  def change
    add_column :manuscript_contents, :order, :integer
  end
end

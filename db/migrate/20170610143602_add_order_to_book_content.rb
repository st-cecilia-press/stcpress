class AddOrderToBookContent < ActiveRecord::Migration
  def change
    add_column :book_contents, :order, :integer
  end
end

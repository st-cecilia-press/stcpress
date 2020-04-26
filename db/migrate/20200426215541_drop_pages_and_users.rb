class DropPagesAndUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :pages
    drop_table :users
  end
end

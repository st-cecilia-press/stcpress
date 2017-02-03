class AddDatesToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :start_date, :integer
    add_column :pieces, :end_date, :integer
  end
end

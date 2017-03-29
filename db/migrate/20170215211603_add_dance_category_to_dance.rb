class AddDanceCategoryToDance < ActiveRecord::Migration
  def change
    add_reference :dances, :dance_category, index: true, foreign_key: true
  end
end

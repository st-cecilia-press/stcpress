class AddPersonToDance < ActiveRecord::Migration
  def change
    add_reference :dances, :person, index: true, foreign_key: true
  end
end

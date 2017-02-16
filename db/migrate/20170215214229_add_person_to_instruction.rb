class AddPersonToInstruction < ActiveRecord::Migration
  def change
    add_reference :instructions, :person, index: true, foreign_key: true
  end
end

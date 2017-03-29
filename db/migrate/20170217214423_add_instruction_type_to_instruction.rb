class AddInstructionTypeToInstruction < ActiveRecord::Migration
  def change
    add_reference :instructions, :instruction_type, index: true, foreign_key: true
  end
end

class Instruction < ActiveRecord::Base
  belongs_to :dance
  belongs_to :person
  belongs_to :instruction_type
end

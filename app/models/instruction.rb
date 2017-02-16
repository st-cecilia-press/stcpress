class Instruction < ActiveRecord::Base
  belongs_to :dance
  belongs_to :person
end

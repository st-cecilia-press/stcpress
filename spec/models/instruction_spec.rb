require 'rails_helper'

RSpec.describe Instruction, type: :model do
  it { should belong_to (:dance) }
  it { should belong_to (:person) }
  it { should belong_to (:instruction_type)}
end

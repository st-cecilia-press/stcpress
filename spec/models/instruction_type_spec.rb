require 'rails_helper'

RSpec.describe InstructionType, type: :model do
  it { should have_many (:instructions)}
end

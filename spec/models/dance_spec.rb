require 'rails_helper'

RSpec.describe Dance, type: :model do
  it { should belong_to(:dance_category) }
  it { should belong_to(:person) }
  it { should have_many(:instructions) }
end

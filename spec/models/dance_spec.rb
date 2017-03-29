require 'rails_helper'

RSpec.describe Dance, type: :model do
  it { should belong_to(:dance_category) }
  it { should belong_to(:person) }
  it { should have_many(:instructions) }
  it { should have_many(:dance_source_contents) }
  it { should have_many(:dance_sources).through(:dance_source_contents) }
end

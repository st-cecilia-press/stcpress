require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should have_many(:taggings) }
  it { should have_many(:pieces).through(:taggings)}
end

RSpec.describe Tag, "validations" do
  it { is_expected.to validate_presence_of(:name) }
end

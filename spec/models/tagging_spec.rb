require 'rails_helper'

RSpec.describe Tagging, type: :model do
  it { should belong_to(:piece) }
  it { should belong_to(:tag) }
end

RSpec.describe Tagging, "validations" do
  it { is_expected.to validate_presence_of(:piece) }
  it { is_expected.to validate_presence_of(:tag) }
end

require 'rails_helper'
RSpec.describe BookContent, type: :model do
  it { should belong_to(:piece)}
  it { should belong_to(:book)}
end

RSpec.describe BookContent, "validations" do
  it { is_expected.to validate_presence_of(:book) }
  it { is_expected.to validate_presence_of(:piece) }
end


require 'rails_helper'
RSpec.describe ManuscriptContent, type: :model do
  it { should belong_to(:piece)}
  it { should belong_to(:manuscript)}
  it { should have_many(:images)}
end

RSpec.describe ManuscriptContent, "validations" do
  it { is_expected.to validate_presence_of(:manuscript) }
  it { is_expected.to validate_presence_of(:piece) }
end

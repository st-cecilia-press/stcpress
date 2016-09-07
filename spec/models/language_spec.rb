require 'rails_helper'

RSpec.describe Language, type: :model do
  it { should have_many(:piece_languages) }
  it { should have_many(:pieces).through(:piece_languages)}
end

RSpec.describe Language, "validations" do
  it { is_expected.to validate_presence_of(:name) }
end

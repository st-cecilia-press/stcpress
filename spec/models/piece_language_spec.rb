require 'rails_helper'

RSpec.describe PieceLanguage, type: :model do
  it { should belong_to(:piece) }
  it { should belong_to(:language) }
end

RSpec.describe PieceLanguage, "validations" do
  it { is_expected.to validate_presence_of(:piece) }
  it { is_expected.to validate_presence_of(:language) }
end


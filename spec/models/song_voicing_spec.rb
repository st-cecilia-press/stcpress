require 'rails_helper'

RSpec.describe SongVoicing, type: :model do
  it { should belong_to(:piece) }
  it { should belong_to(:voicing) }
end

RSpec.describe SongVoicing, "validations" do
  it { is_expected.to validate_presence_of(:piece) }
  it { is_expected.to validate_presence_of(:voicing) }
end

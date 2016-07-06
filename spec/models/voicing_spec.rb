require 'rails_helper'

RSpec.describe Voicing, type: :model do
  it { should have_many(:song_voicings) }
  it { should have_many(:pieces).through(:song_voicings)}
end

RSpec.describe Voicing, "validations" do
  it { is_expected.to validate_presence_of(:name) }
end

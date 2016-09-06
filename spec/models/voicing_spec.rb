require 'rails_helper'

RSpec.describe Voicing, type: :model do
  it { should have_many(:song_voicings) }
  it { should have_many(:pieces).through(:song_voicings)}
end

RSpec.describe Voicing, "validations" do
  it { is_expected.to validate_presence_of(:name) }
end

RSpec.describe Voicing, "num_parts" do
  it "returns 1 if Heterophonic" do
    v = create(:voicing, name: 'Heterophonic')
    expect(v.num_parts).to eq('1')
  end
  it "returns length of parts if not Heterophonic" do
    v = create(:voicing, name: 'SATB')
    expect(v.num_parts).to eq('4')
  end
end

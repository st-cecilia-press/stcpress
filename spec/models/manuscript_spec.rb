require 'rails_helper'

RSpec.describe Manuscript, type: :model do
  it { should have_many(:manuscript_contents) }
  it { should have_many(:pieces).through(:manuscript_contents) }
  it { should have_many(:facsimile_sources) }
end
RSpec.describe Manuscript, "validations" do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:slug) }
  it { is_expected.to validate_uniqueness_of(:slug) }
end

RSpec.describe Manuscript, "diamm_link" do
  it "returns expected if link exists link" do
    man = create(:manuscript, diamm: '8888')
    link = man.diamm_link
    expect(link).to eq('https://www.diamm.ac.uk/sources/8888')
  end
  it "returns nil if diamm is nil" do
    man = create(:manuscript, diamm: nil)
    link = man.diamm_link
    expect(link).to be_nil
  end
end

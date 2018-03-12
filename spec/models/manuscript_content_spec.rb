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

RSpec.describe ManuscriptContent, "diamm_link" do
  it "returns expected if link exists link" do
    man = create(:manuscript_content, diamm: '8888')
    link = man.diamm_link
    expect(link).to eq('https://www.diamm.ac.uk/compositions/8888')
  end
  it "returns nil if diamm is nil" do
    man = create(:manuscript_content, diamm: nil)
    link = man.diamm_link
    expect(link).to be_nil
  end
end

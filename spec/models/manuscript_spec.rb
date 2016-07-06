require 'rails_helper'

RSpec.describe Manuscript, type: :model do
  it { should have_many(:manuscript_contents) }
  it { should have_many(:pieces).through(:manuscript_contents) }
end
RSpec.describe Manuscript, "validations" do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:slug) }
  it { is_expected.to validate_uniqueness_of(:slug) }
end

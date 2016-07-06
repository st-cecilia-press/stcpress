require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should have_many(:book_contents) }
  it { should have_many(:pieces).through(:book_contents) }
end
RSpec.describe Book, "validations" do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:slug) }
  it { is_expected.to validate_uniqueness_of(:slug) }
end


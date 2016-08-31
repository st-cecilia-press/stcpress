require 'rails_helper'

RSpec.describe Repository, type: :model do
  it { should have_many(:publicationships) }
  it { should have_many(:publicationships) }
end
RSpec.describe Repository, "validations" do
  it { is_expected.to validate_presence_of(:name) }
end

require 'rails_helper'

RSpec.describe Publicationship, type: :model do
  it { should belong_to(:piece) }
  it { should belong_to(:repository) }
end

RSpec.describe Publicationship, "validations" do
  it { is_expected.to validate_presence_of(:piece) }
  it { is_expected.to validate_presence_of(:repository) }
end

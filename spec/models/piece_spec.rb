require 'rails_helper'

RSpec.describe Piece, type: :model do
  it { should have_many(:manuscript_contents) }
  it { should have_many(:manuscripts).through(:manuscript_contents)}

  it { should have_many(:book_contents) }
  it { should have_many(:books).through(:book_contents)}

  it { should belong_to(:composer) }
end

RSpec.describe Piece, "validations" do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:composer) }
  it { is_expected.to validate_presence_of(:slug) }
  it { is_expected.to validate_presence_of(:repo) }
end

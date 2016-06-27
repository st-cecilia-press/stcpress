require 'rails_helper'

RSpec.describe Piece, "validations" do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:composer) }
  it { is_expected.to validate_presence_of(:slug) }
  it { is_expected.to validate_presence_of(:repo) }
end

require 'rails_helper'
require 'fileutils'
require 'tempfile'

RSpec.describe Piece, type: :model do
  it { should have_many(:manuscript_contents) }
  it { should have_many(:manuscripts).through(:manuscript_contents)}

  it { should have_many(:book_contents) }
  it { should have_many(:books).through(:book_contents)}

  it { should have_many(:song_voicings) }
  it { should have_many(:voicings).through(:song_voicings)}

  it { should belong_to(:composer) }

  it { should have_many(:publicationships) }
  it { should have_many(:repositories).through(:publicationships)}
end

RSpec.describe Piece, "validations" do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:composer) }
  it { is_expected.to validate_presence_of(:slug) }
end

RSpec.describe Piece, "url" do
  it "returns url with slug" do
    piece = create(:piece)
    url = piece.url
    expect(url).to eq("/pieces/#{piece.slug}")
  end
end

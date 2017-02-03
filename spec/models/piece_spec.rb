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
  
  it { should have_many(:taggings) }
  it { should have_many(:tags).through(:taggings)}

  it { should have_many(:piece_languages) }
  it { should have_many(:languages).through(:piece_languages)}
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

RSpec.describe Piece, "image_repo" do
  it "returns miscellaneous repository if it exists" do
    piece = create(:piece)
    other = create(:vocal_collection, slug: 'other')
    misc = create(:vocal_collection, slug: 'miscellaneous')
    pub1 = create(:publicationship, piece: piece, repository: other)
    pub2 = create(:publicationship, piece: piece, repository: misc)

    image_repo = piece.image_repo
    expect(image_repo).to eq("miscellaneous")
  end
  it "returns whatever other repo if miscellaneous doesn't exist" do
    piece = create(:piece)
    other = create(:vocal_collection, slug: 'other')
    pub1 = create(:publicationship, piece: piece, repository: other)
    image_repo = piece.image_repo
    expect(image_repo).to eq("other")
  end
end

RSpec.describe Piece, "date_description" do
  it 'returns year if single year' do
    piece = create(:piece, start_date: 1500, end_date: 1500) 
    date = piece.date
    expect(date).to eq('1500')
  end
  it 'returns single century if dates within a single century' do
    piece = create(:piece, start_date: 1401, end_date: 1450) 
    date = piece.date
    expect(date).to eq('15th century')
  end
  it 'returns multiple centuries if dates over multiple centuries' do
    piece = create(:piece, start_date: 1301, end_date: 1450) 
    date = piece.date
    expect(date).to eq('14th - 15th century')
  end
end

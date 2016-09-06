require 'rails_helper'
require 'fileutils'


describe "Get /pieces/slug where repo is 'vocal_collection' type" do
  before(:each) do
    @public_path = Rails.public_path.to_s
    Dir.mkdir("#{@public_path}/repo")
    Dir.mkdir("#{@public_path}/repo/slug")
    @path = "#{@public_path}/repo/slug"
  end
  after(:each) do
    FileUtils.rm_r "#{@public_path}/repo" 
  end
  it "shows piece slug" do

    repo = create(:vocal_collection, name: 'repo')
    composer = create(:composer)
    piece = create(:piece, composer: composer)
    pub = create(:publicationship, piece: piece, repository: repo)

    get "/pieces/#{piece.slug}"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(piece.title)
    expect(response.body).to include(piece.composer.name)
  end
end

describe "Get /pieces/slug where repo is 'instrumental_book'" do
  before(:each) do
    @gervaise = 'gervaise_quart'
    @public_path = Rails.public_path.to_s
    Dir.mkdir("#{@public_path}/#{@gervaise}")
    Dir.mkdir("#{@public_path}/#{@gervaise}/slug")
    @path = "#{@public_path}/#{@gervaise}/slug"
  end
  after(:each) do
    FileUtils.rm_r "#{@public_path}/#{@gervaise}" 
  end
  it "Shows Original Clef and Modern Clef Options. Does not show Mp3" do
      repo = create(:instrumental_book, name: @gervaise)
      piece = create(:piece, slug: "slug" )
      pub = create(:publicationship, piece: piece, repository: repo)
      `touch #{@public_path}/#{@gervaise}/slug/slug_modern.pdf`
      `touch #{@public_path}/#{@gervaise}/slug/slug_orig.pdf`
      get "/pieces/slug"
      expect(response.body).to include('Original Clefs')
      expect(response.body).to include('Modern Clefs')
      expect(response.body).not_to include('MP3')
  end
  
end

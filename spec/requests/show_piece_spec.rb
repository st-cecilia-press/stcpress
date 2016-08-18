require 'rails_helper'
require 'fileutils'

describe "GET /pieces/repo/piece" do
  before(:each) do
    @public_path = Rails.public_path.to_s
    Dir.mkdir("#{@public_path}/repo")
    Dir.mkdir("#{@public_path}/repo/slug")
    @path = "#{@public_path}/repo/slug"
  end
  after(:each) do
    FileUtils.rm_r "#{@public_path}/repo" 
  end
  it "shows piece with title and composer" do
    composer = create(:composer)
    piece = create(:piece, composer: composer)

    get "/pieces/#{piece.repo}/#{piece.slug}"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(piece.title)
    expect(response.body).to include(piece.composer.name)
  end
  it "shows piece's manuscript(s) if they exist" do
    piece = create(:piece)
    manuscript = create(:manuscript)
    mc = create(:manuscript_content, piece: piece, manuscript: manuscript)

    get "/pieces/#{piece.repo}/#{piece.slug}"
    expect(response.body).to include(piece.title)
    expect(response.body).to include(manuscript.name)

  end
  it "shows piece's book(s) if they exist" do
    piece = create(:piece)
    book = create(:book, date: Date.new(1600))
    bc = create(:book_content, piece: piece, book: book)

    get "/pieces/#{piece.repo}/#{piece.slug}"
    expect(response.body).to include(piece.title)
    expect(response.body).to include(book.title)
  end
  it "shows voicings and number of voices" do
    piece = create(:piece)
    voicing = create(:voicing, name: 'SATB')
    voicing2 = create(:voicing, name: 'STTB')
    sv1 = create(:song_voicing, piece: piece, voicing: voicing)
    sv2 = create(:song_voicing, piece: piece, voicing: voicing2)

    get "/pieces/#{piece.repo}/#{piece.slug}"
    
    expect(response.body).to include('SATB')
    expect(response.body).to include('STTB')
    expect(response.body).to include('4')
    
  end
end

describe "Get /pieces/piece" do
  before(:each) do
    @public_path = Rails.public_path.to_s
    Dir.mkdir("#{@public_path}/repo")
    Dir.mkdir("#{@public_path}/repo/slug")
    @path = "#{@public_path}/repo/slug"
  end
  after(:each) do
    FileUtils.rm_r "#{@public_path}/repo" 
  end
  it "shows piece if it's the only piece with slug" do
    composer = create(:composer)
    piece = create(:piece, composer: composer)

    get "/pieces/#{piece.slug}"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(piece.title)
    expect(response.body).to include(piece.composer.name)
  end
  describe "when more than one repo has piece with the same slug" do
    before(:each) do
      Dir.mkdir("#{@public_path}/repo2") 
      Dir.mkdir("#{@public_path}/repo2/slug") 
    end
    after(:each) do
      FileUtils.rm_r "#{@public_path}/repo2" 
    end
    it "shows disambiguation page with both pieces" do
      piece = create(:piece, slug: "slug")
      piece2 = create(:piece, repo: "repo2", slug: "slug")
      get "/pieces/slug"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(piece.repo)
      expect(response.body).to include(piece2.repo)
    end
  end
end

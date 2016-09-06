require 'rails_helper'
require 'fileutils'

RSpec.describe TranslationsCollection, "editions" do
  before(:each) do
    @public_path = Rails.public_path.to_s
    Dir.mkdir("#{@public_path}/repo")
    @path = "#{@public_path}/repo"
  end 
  after(:each) do
    FileUtils.rm_r @path
  end
  it "returns pdf" do
    piece = create(:piece, slug: 'slug')
    repo = create(:translations_collection, name: 'repo')
    pub = create(:publicationship, piece: piece, repository: repo)
    edition = repo.editions(piece)
    expect(edition).to eq('/repo/slug.pdf')
  end
end

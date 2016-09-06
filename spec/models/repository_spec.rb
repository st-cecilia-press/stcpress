require 'rails_helper'

RSpec.describe Repository, type: :model do
  it { should have_many(:publicationships) }
  it { should have_many(:publicationships) }
end
RSpec.describe Repository, "validations" do
  it { is_expected.to validate_presence_of(:name) }
end

RSpec.describe Repository, "editions" do
  before(:each) do
    @public_path = Rails.public_path.to_s
    Dir.mkdir("#{@public_path}/repo")
    Dir.mkdir("#{@public_path}/repo/slug")
    @path = "#{@public_path}/repo/slug"
  end 
  after(:each) do
    FileUtils.rm_r "#{@public_path}/repo" 
  end
  it "returns not empty hash if pdf there is missing _mute.mid" do
    piece = create(:piece, slug: 'slug')
    repo = create(:repository, name: 'repo')

    publicationship = create(:publicationship, piece: piece, repository: repo)

    pdf = File.new("#{@path}/slug.pdf", "w")
    editions = repo.editions(piece)
    expect(editions).not_to be_nil 
    expect(editions.first[:parts]).to be_nil
    
  end 
  it "returns hash with pdfs and part midis and mp3s if _mute.mid exists" do
    piece = create(:piece, slug: 'slug')
    repo = create(:repository, name: 'repo')
    publicationship = create(:publicationship, piece: piece, repository: repo)

    pdf = File.new("#{@path}/slug.pdf", "w")
    pdfTransposed = File.new("#{@path}/slug-transposed.pdf", "w")
    midi_mute = File.new("#{@path}/slug_cantus_mute.mid", "w")
    lily = File.new("#{@path}/slug.ly", "w")
    lily.write('scMusicOneName = "cantus"')
     
    editions = repo.editions(piece)
    expect(editions).not_to be_nil 
    expect(editions.first[:parts]).not_to be_nil 
    
  end
  
end
RSpec.describe Repository, "parts" do
  it "gets list of parts and their order" do
    fake_ly = Tempfile.new('lily')
      
    fake_ly.write( %q{
scMusicOneName = "cantus"
scMusicTwoName = "altus"
scMusicThreeName = "tenor"
    } )
    fake_ly.close
    repo = create(:vocal_collection)
    parts = repo.parts(fake_ly.path)
    fake_ly.unlink
    expect(parts.any? { |part| (part[:name] == 'cantus' && part[:order] == 1) }).to be
    expect(parts.any? { |part| (part[:name] == 'altus' && part[:order] == 2) }).to be
    expect(parts.any? { |part| (part[:name] == 'tenor' && part[:order] == 3) }).to be
    
    
  
  end
end

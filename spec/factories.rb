FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  factory :user do
    email {generate :email}
    password Devise.friendly_token.first(8)  
    name 'Mundungus'
    admin false
  end
  factory :audio_recording do
    slug 'audio' 
    ensemble
  end
  factory :instruction_audio do
    audio_recording 
    instruction 
  end
  factory :instruction_sheetmusic do
    sheet_music 
    instruction 
  end
  factory :dance_source_content do
    dance 
    dance_source 
  end
  factory :dance_facsimile_image do
    url "MyString"
    filename "MyString"
    description "MyString"
    name "MyString"
  end
  factory :dance_translation do
    name "MyString"
    url "MyString"
  end
  factory :dance_source do
    start_date 1651 
    end_date 1651
    title "Earliest Dance Source"
    slug "earliest_dance_source"
  end
  factory :music_file do
    filename "MyString"
    source "MyString"
    name "MyString"
    sheet_music nil
  end
  factory :sheet_music do
    
  end
  factory :video_recording do
    name "MyString"
    youtube "MyString"
  end
  factory :audioRecording do
    ensemble 
    purchase_url "MyString"
    youtube "MyString"
    file "MyString"
  end
  factory :ensemble do
    description "MyString"
    name "MyString"
    slug "MyString"
  end
  factory :instruction_type do
    name "MyString"
  end
  factory :instruction do
    text "MyText"
    dance 
    instruction_type
  end
  factory :person do
    name "MyString"
  end
  factory :dance_category do
    name "English Country"
  end
  factory :dance do
    title "Gathering Peascods"
    slug "gathering_peascods"
  end
  factory :facsimile_source do
    name "MyString"
    url "MyString"
    manuscript 
    book 
  end
  factory :tagging do
    tag
    piece
  end
  factory :piece_language do
    language
    piece
  end
  factory :language do
    name "English"
  end
  factory :tag do
    name "frottola"
  end
  factory :publicationship do
    piece 
    repository 
  end
  factory :translations_collection do
    name "Repo"
    slug "repo"
  end
  factory :instrumental_book do
    name "Repo"
    slug "repo"
  end
  factory :vocal_collection do
    name "Repo"
    slug "repo"
  end
  factory :repository do
    name "My Repo"
    slug "my_repo"
  end
  factory :song_voicing do
    voicing 
    piece 
  end
  factory :voicing do
    name "SSSSSSSSSSSB"
  end
  factory :image do
    book_content
    manuscript_content
    name "Image Name" 
  end
  factory :book_content do
    book 
    piece 
  end
  factory :book do
    title "Biggest Book of Chansons"
    date Date.new(1600)
    sequence(:slug) { |n| "slug#{n}" }
  end
  factory :manuscript_content do
    manuscript
    piece 
  end
  factory :manuscript do
    name "Blackcloak Manuscript"
    sequence(:slug) { |n| "slug#{n}" }
  end
  factory :piece do
    title "My Piece"
    composer
    slug "slug"
  end
  factory :composer do
    name "Josquin"
  end
end

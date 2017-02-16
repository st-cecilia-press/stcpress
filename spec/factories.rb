FactoryGirl.define do
  factory :instruction do
    text "MyText"
    dance 
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

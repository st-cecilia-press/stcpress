FactoryGirl.define do
  factory :publicationship do
    piece 
    repository 
  end
  factory :instrumental_book do
    name "repo"
  end
  factory :individual_pieces do
    name "repo"
  end
  factory :repository do
    name "myRepo"
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

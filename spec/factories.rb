FactoryGirl.define do
  factory :manuscript_content do
    manuscript
    piece 
  end
  factory :manuscript do
    name "Blackcloak Manuscript"
  end
  factory :piece do
    title "My Piece"
    composer
    repo "repo"
    slug "page_slug"
  end
  factory :composer do
    name "Josquin"
  end
end

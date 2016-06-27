FactoryGirl.define do
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

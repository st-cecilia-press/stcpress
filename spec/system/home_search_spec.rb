require 'rails_helper'

RSpec.describe "Search on Home page" do
  it "custom search goes to google" do
      visit '/'
      fill_in "home-search", with: "Blah"
      click_on "home-submit" 
      expect(page).to have_text('Search Results')
  end
  it "select from autcomplete goes to piece page", :js=> true do
      composer = create(:composer, name: 'Guillaume Dufay')
      piece = create(:piece, title: 'Se La Face Ay Payle', composer: composer, slug: 'se_la_face')
      visit '/'
      fill_in "search", with: "#{piece.title} (#{composer.name})"
      execute_script('document.getElementById("hidden-home-slug").value = "se_la_face"')
      click_on "Submit" 
      expect(page).to have_text(piece.title)
  end
end

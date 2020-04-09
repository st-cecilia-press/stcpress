#require 'rails_helper'
#require 'capybara/poltergeist'
#Capybara.javascript_driver = :poltergeist
#RSpec.feature "Search on Home page" do
#  scenario "custom search goes to google" do
#      visit '/'
#      fill_in "search", with: "Blah"
#      click_on "Submit" 
#      expect(page).to have_text('Google')
#  end
#  scenario "select from autcomplete goes to piece page", :js=> true do
#      composer = create(:composer, name: 'Guillaume Dufay')
#      piece = create(:piece, title: 'Se La Face Ay Payle', composer: composer, slug: 'se_la_face')
#      byebug
#      visit '/'
#      fill_in "search", with: "#{piece.title} (#{composer.name})"
#      execute_script('$("#hidden-input").val("se_la_face")')
#      click_on "Submit" 
#      expect(page).to have_text(piece.title)
#      expect(page).to have_current_path(piece.path)
#  end
#end

require 'rails_helper'

describe "GET /manuscripts" do
  it "shows all books with title and year and link to appropriate page" do
    manuscript1 = create(:manuscript, shelfmark: 300, archive: 'Archive')
    manuscript2 = create(:manuscript, name: 'Brunswick Stew Codex', shelfmark: 666, archive: 'The Archive')

    
    get '/manuscripts'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("<a href=\"/manuscripts/#{manuscript1.slug}\">#{manuscript1.name}</a>")
    expect(response.body).to include("<a href=\"/manuscripts/#{manuscript2.slug}\">#{manuscript2.name}</a>")
    expect(response.body).to include(manuscript1.shelfmark)
    expect(response.body).to include(manuscript1.archive)
    expect(response.body).to include(manuscript2.shelfmark)
    expect(response.body).to include(manuscript2.archive)
  end
end

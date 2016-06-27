require 'rails_helper'

describe "GET /pieces" do
  it "shows all pieces with title and composer and link to appropriate page" do
    composer1 = create(:composer)
    piece1 = create(:piece, composer: composer1)

    composer2 = create(:composer, name: 'Thomas Morley')
    piece2 = create(:piece, title: 'Go Ye', slug: "slug2", composer: composer2)
    
    get '/pieces'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("<a href=\"/pieces/#{piece1.repo}/#{piece1.slug}\">#{piece1.title}</a>")
    expect(response.body).to include("<a href=\"/pieces/#{piece2.repo}/#{piece2.slug}\">#{piece2.title}</a>")
    expect(response.body).to include(piece1.composer.name)
    expect(response.body).to include(piece2.composer.name)
  end
end

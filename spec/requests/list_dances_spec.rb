require 'rails_helper'

describe "GET /dances" do
  it "shows all dances with title and link to dance page" do
    category = create(:dance_category)
    dance1 = create(:dance, dance_category: category)
    dance2 = create(:dance, title: 'Gelosia', slug: 'gelosia', dance_category: category)
    

    get '/dances'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("<a href=\"/dances/#{dance1.slug}\">#{dance1.title}</a>")
    expect(response.body).to include("<a href=\"/dances/#{dance2.slug}\">#{dance2.title}</a>")
  end
end

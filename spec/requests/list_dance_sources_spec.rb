require 'rails_helper'

describe "GET /dances_sources" do
  it "shows all dances with title and link to dance page" do
    source1 = create(:dance_source)
    source2 = create(:dance_source, title: 'Dance Source 2', slug: 'gelosia')

    get '/dance_sources'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("<a href=\"/dance_sources/#{source1.slug}\">#{source1.title}</a>")
    expect(response.body).to include("<a href=\"/dance_sources/#{source2.slug}\">#{source2.title}</a>")
  end
end

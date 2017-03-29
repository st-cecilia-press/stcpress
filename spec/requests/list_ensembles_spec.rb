require 'rails_helper'

describe "GET /ensembles" do
  it "shows all ensembles with title and link to dance page" do
    ens1 = create(:ensemble)
    ens2 = create(:ensemble, name: 'Dance Band 2', slug: 'dance_band_2')

    get '/ensembles'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("<a href=\"/ensembles/#{ens1.slug}\">#{ens1.name}</a>")
    expect(response.body).to include("<a href=\"/ensembles/#{ens2.slug}\">#{ens2.name}</a>")
  end
end

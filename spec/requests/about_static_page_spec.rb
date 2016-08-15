require 'rails_helper'

describe "GET /about" do
  it "shows about page" do

    get "/about"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('About St. Cecilia Press')
  end
end

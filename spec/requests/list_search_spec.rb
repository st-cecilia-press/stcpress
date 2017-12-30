require 'rails_helper'

describe "Get /search" do
  it "shows search page" do
    
    get '/search'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("Search Results")
  end
end

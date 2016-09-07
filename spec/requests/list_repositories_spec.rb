require 'rails_helper'

describe "Get /repositories" do
  it "shows all repositories with name and link to appropriate repo" do
    repo1 = create(:instrumental_book, name: 'repo1')   
    repo2 = create(:vocal_collection, name: 'repo2')   
    repo3 = create(:translations_collection, name: 'repo3')   
    
    get '/repositories'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("<a href=\"/repositories/#{repo1.name}\">#{repo1.name}</a>")
    expect(response.body).to include("<a href=\"/repositories/#{repo1.name}\">#{repo1.name}</a>")
    expect(response.body).to include("<a href=\"/repositories/#{repo1.name}\">#{repo1.name}</a>")
  end
end

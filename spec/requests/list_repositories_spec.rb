require 'rails_helper'

describe "Get /repositories" do
  it "shows all repositories with name and link to appropriate repo" do
    repo1 = create(:instrumental_book, slug: 'repo1', name: 'Repo1')   
    repo2 = create(:vocal_collection, slug: 'repo2', name: 'Repo2')   
    repo3 = create(:translations_collection, slug: 'repo3', name: 'Repo3')   
    
    get '/repositories'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("<a href=\"/repositories/#{repo1.slug}\">#{repo1.name}</a>")
    expect(response.body).to include("<a href=\"/repositories/#{repo1.slug}\">#{repo1.name}</a>")
    expect(response.body).to include("<a href=\"/repositories/#{repo1.slug}\">#{repo1.name}</a>")
  end
  it "does not show dance repository" do
    repo1 = create(:dance_repository, slug: 'repo1', name: 'Repo1')   
    get '/repositories'
    expect(response).to have_http_status(:success)
    expect(response.body).not_to include("<a href=\"/repositories/#{repo1.slug}\">#{repo1.name}</a>")
  end
end

require 'rails_helper'
describe "Get /repositories/name" do
  it "shows repo name and pieces in repository for instrumental_book" do
    piece = create(:piece)
    repo = create(:instrumental_book)
    pub = create(:publicationship, piece: piece, repository: repo)

    get "/repositories/#{repo.slug}"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(repo.name)
    expect(response.body).to include(piece.title)
  end
  it "404s if it's a dance repository" do
    repo1 = create(:dance_repository, slug: 'repo1', name: 'Repo1')   
    expect{get "/repositories/#{repo1.slug}"}.to raise_error(ActionController::RoutingError)
  end
end

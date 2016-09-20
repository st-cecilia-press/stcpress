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
end

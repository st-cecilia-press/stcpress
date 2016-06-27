require 'rails_helper'

describe "GET /repo/piece" do
  it "show piece with title and composer" do
    composer = create(:composer)
    piece = create(:piece, composer: composer)

    get "/pieces/#{piece.repo}/#{piece.slug}"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(piece.title)
    expect(response.body).to include(piece.composer.name)
  end
end

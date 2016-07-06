require 'rails_helper'

describe "GET /manuscripts/slug" do
  it "shows manuscript with name and pieces" do
    manuscript = create(:manuscript)
    piece = create(:piece)
    mc = create(:manuscript_content, piece: piece, manuscript: manuscript)

    get "/manuscripts/#{manuscript.slug}"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(manuscript.name)
    expect(response.body).to include(piece.title)
  end
end

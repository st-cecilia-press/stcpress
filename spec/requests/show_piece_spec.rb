require 'rails_helper'

describe "GET /repo/piece" do
  it "shows piece with title and composer" do
    composer = create(:composer)
    piece = create(:piece, composer: composer)

    get "/pieces/#{piece.repo}/#{piece.slug}"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(piece.title)
    expect(response.body).to include(piece.composer.name)
  end
  it "shows piece's manuscript(s) if they exist" do
    piece = create(:piece)
    manuscript = create(:manuscript)
    mc = create(:manuscript_content, piece: piece, manuscript: manuscript)

    get "/pieces/#{piece.repo}/#{piece.slug}"
    expect(response.body).to include(piece.title)
    expect(response.body).to include(manuscript.name)

  end
  it "shows piece's book(s) if they exist" do
    piece = create(:piece)
    book = create(:book)
    bc = create(:book_content, piece: piece, book: book)

    get "/pieces/#{piece.repo}/#{piece.slug}"
    expect(response.body).to include(piece.title)
    expect(response.body).to include(book.title)
  end
end

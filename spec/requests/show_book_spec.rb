require 'rails_helper'

describe "GET /books/slug" do
  it "shows book with name and pieces" do
    book = create(:book)
    piece = create(:piece)
    bc = create(:book_content, piece: piece, book: book)

    get "/books/#{book.slug}"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(book.title)
    expect(response.body).to include(piece.title)
  end
end

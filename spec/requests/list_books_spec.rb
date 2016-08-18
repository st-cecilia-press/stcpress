require 'rails_helper'

describe "GET /books" do
  it "shows all books with title and year and link to appropriate page" do
    book1 = create(:book, date: Date.new(1585))
    book2 = create(:book, title: 'Second Book of Songs', date: Date.new(1600))

    
    get '/books'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("<a href=\"/books/#{book1.slug}\">#{book1.title}</a>")
    expect(response.body).to include("<a href=\"/books/#{book2.slug}\">#{book2.title}</a>")
    expect(response.body).to include(book1.date.strftime('%Y'))
    expect(response.body).to include(book2.date.strftime('%Y'))
  end
  it "shows composers in book" do
    book = create(:book, date: Date.new(1585))
    composer1 = create(:composer)
    composer2 = create(:composer, name: 'Composer Composerson')
    piece1 = create(:piece, composer: composer1)
    piece2 = create(:piece, composer: composer2)
    bc1 = create(:book_content, piece: piece1, book: book)
    bc2 = create(:book_content, piece: piece2, book: book)

    get '/books'
    expect(response.body).to include(composer1.name)
    expect(response.body).to include(composer2.name)
  end
end

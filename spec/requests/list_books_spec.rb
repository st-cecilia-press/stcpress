require 'rails_helper'

describe "GET /books" do
  it "shows all books with title and year and link to appropriate page" do
    book1 = create(:book, date: Date.new(1585))
    book2 = create(:book, title: 'Second Book of Songs', date: Date.new(1600))

    
    get '/books'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("<a href=\"/books/#{book1.slug}\">#{book1.title}</a>")
    expect(response.body).to include("<a href=\"/books/#{book2.slug}\">#{book2.title}</a>")
    expect(response.body).to include(book1.date.to_s)
    expect(response.body).to include(book2.date.to_s)
  end
end

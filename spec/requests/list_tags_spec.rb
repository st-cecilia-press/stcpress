
describe "GET /tags" do
  it "shows all tags" do
    tag1 = create(:tag, name: 'tag')
    tag2 = create(:tag, name: 'tag2')

    
    get '/tags'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("href=\"/tags/#{tag1.name}\">#{tag1.name}</a>")
    expect(response.body).to include("href=\"/tags/#{tag2.name}\">#{tag2.name}</a>")
  end
  it "shows piece count for each tag" do
      tag = create(:tag)
      piece1 = create(:piece)
      piece2 = create(:piece, slug: 'piece2')
      t1 = create(:tagging, piece: piece1, tag: tag)
      t2 = create(:tagging, piece: piece2, tag: tag)

      get '/tags'
      expect(response.body).to include('<span class="badge">2</span>')
  end
end

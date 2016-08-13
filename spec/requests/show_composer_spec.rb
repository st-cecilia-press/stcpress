require 'rails_helper'
describe "GET /composers/Composer_Name" do
  it "show composer with list of pieces" do
    composer = create(:composer, name: 'John Doe')
    piece = create(:piece, composer: composer)
    get "/composers/John_Doe"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(composer.name)
    expect(response.body).to include(piece.title)
    
  end
end

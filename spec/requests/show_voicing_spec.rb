require 'rails_helper'
describe "Get /pieces/voicings/:voicing" do
  it "shows pieces with given voicing in text" do
    piece = create(:piece)
    voicing = create(:voicing, name: 'SATB')
    sv1 = create(:song_voicing, piece: piece, voicing: voicing)
    
    get "/pieces/voicings/SATB"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(piece.title)
  end
  it "shows pieces with given voicing number" do
    piece = create(:piece)
    voicing = create(:voicing, name: 'SATB')
    sv1 = create(:song_voicing, piece: piece, voicing: voicing)
    
    get "/pieces/voicings/4"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(piece.title)
  end
end

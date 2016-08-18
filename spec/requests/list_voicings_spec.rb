require 'rails_helper'

describe "Get /pieces/voicings" do
 it "shows list of voicing options with links to each voicing" do
    piece = create(:piece)
    voicing = create(:voicing, name: 'SATB')
    voicing2 = create(:voicing, name: 'STTB')
    sv1 = create(:song_voicing, piece: piece, voicing: voicing)
    sv2 = create(:song_voicing, piece: piece, voicing: voicing2)

    get "/pieces/voicings"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('<a href="/pieces/voicings/4">4</a>')
    expect(response.body).to include('<a href="/pieces/voicings/SATB">SATB</a>')
    expect(response.body).to include('<a href="/pieces/voicings/STTB">STTB</a>')

 end
end

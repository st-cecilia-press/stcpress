require 'rails_helper'
describe "GET /ensembles/ensemble" do
  it "shows ensemble with dances" do
    ens = create(:ensemble, name: 'Ensemble', slug: 'ensemble')
    dance = create(:dance, title: 'Gathering Peascods', slug: 'slug')
    inst = create(:instruction, dance: dance)
    audio_recording = create(:audio_recording, ensemble: ens) 
    instruction_audio = create(:instruction_audio, audio_recording: audio_recording, instruction: inst)
    get "/ensembles/ensemble"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(dance.title)
    expect(response.body).to include(ens.name)
  end
end

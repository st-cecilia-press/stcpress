require 'rails_helper'

RSpec.describe Ensemble, type: :model do
  it { should have_many(:audio_recordings) }  
end

RSpec.describe Ensemble, 'dances' do
  it 'returns dances associated with a given ensmebles audio' do
    ens = create(:ensemble)
    ar = create(:audio_recording, ensemble: ens)
    dance = create(:dance)
    inst = create(:instruction, dance: dance)  
    inst_audio = create(:instruction_audio, instruction: inst, audio_recording: ar) 
    expect(ens.dances).to include(dance)
  end

  it 'returns only distinct dance matches when multiple instructions for a given dance' do
    ens = create(:ensemble)
    ar = create(:audio_recording, ensemble: ens)
    dance = create(:dance)
    inst = create(:instruction, dance: dance)  
    inst2 = create(:instruction, dance: dance)
    inst_audio = create(:instruction_audio, instruction: inst, audio_recording: ar) 
    inst_audio = create(:instruction_audio, instruction: inst2, audio_recording: ar) 
    expect(ens.dances.count).to eq(1)
  end
  it 'returns only distinct dance matches when multiple recordings for a given dance' do
    ens = create(:ensemble)
    ar = create(:audio_recording, ensemble: ens)
    ar2 = create(:audio_recording, ensemble: ens)
    dance = create(:dance)
    inst = create(:instruction, dance: dance)  
    inst_audio = create(:instruction_audio, instruction: inst, audio_recording: ar) 
    inst_audio2 = create(:instruction_audio, instruction: inst, audio_recording: ar2) 
    expect(ens.dances.count).to eq(1)
  end
end

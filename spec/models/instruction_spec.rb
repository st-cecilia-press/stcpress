require 'rails_helper'

RSpec.describe Instruction, type: :model do
  it { should belong_to (:dance) }
  it { should belong_to (:person) }
  it { should belong_to (:instruction_type)}
  it { should have_many(:video_recordings) }
  it { should have_many(:instruction_audios) }
  it { should have_many(:instruction_sheetmusics) }
  it { should have_many(:sheet_musics).through(:instruction_sheetmusics)}
  it { should have_many(:audio_recordings).through(:instruction_audios) }
  
end

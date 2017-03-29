require 'rails_helper'

RSpec.describe InstructionAudio, type: :model do
  it { should belong_to (:instruction) }
  it { should belong_to (:audio_recording) }
end

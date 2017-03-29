require 'rails_helper'

RSpec.describe AudioRecording, type: :model do
  it { should belong_to(:ensemble) }
  it { should have_many(:instruction_audios) }
  it { should have_many(:instructions).through(:instruction_audios) }
end

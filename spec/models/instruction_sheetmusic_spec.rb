require 'rails_helper'

RSpec.describe InstructionSheetmusic, type: :model do
  it { should belong_to (:instruction) }
  it { should belong_to (:sheet_music) }
end

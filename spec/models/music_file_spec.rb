require 'rails_helper'

RSpec.describe MusicFile, type: :model do
  it { should belong_to(:sheet_music) }
end

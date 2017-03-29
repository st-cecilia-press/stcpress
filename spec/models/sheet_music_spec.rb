require 'rails_helper'

RSpec.describe SheetMusic, type: :model do
  it { should have_many(:music_files) }
end

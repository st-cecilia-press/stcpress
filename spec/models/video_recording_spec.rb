require 'rails_helper'

RSpec.describe VideoRecording, type: :model do
  it { should belong_to(:instruction)}
end

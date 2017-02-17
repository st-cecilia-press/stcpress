require 'rails_helper'

RSpec.describe Ensemble, type: :model do
  it { should have_many(:audio_recordings) }  
end

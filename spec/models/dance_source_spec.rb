require 'rails_helper'

RSpec.describe DanceSource, type: :model do
  it { should have_many(:dance_source_contents) }
  it { should have_many(:dances).through(:dance_source_contents) }
end

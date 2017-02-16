require 'rails_helper'

RSpec.describe DanceCategory, type: :model do
  it { should have_many(:dances) }
end

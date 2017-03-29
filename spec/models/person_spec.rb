require 'rails_helper'

RSpec.describe Person, type: :model do
 it { should have_many(:dances) }
 it { should have_many(:instructions) }
end

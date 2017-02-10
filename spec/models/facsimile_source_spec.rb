require 'rails_helper'

RSpec.describe FacsimileSource, type: :model do
  it { should belong_to(:manuscript)}
  it { should belong_to(:book)}
end

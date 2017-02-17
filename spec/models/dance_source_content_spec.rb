require 'rails_helper'

RSpec.describe DanceSourceContent, type: :model do
  it { should belong_to(:dance)}
  it { should belong_to(:dance_source)}
end

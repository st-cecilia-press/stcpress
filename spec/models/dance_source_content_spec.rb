require 'rails_helper'

RSpec.describe DanceSourceContent, type: :model do
  it { should have_many(:dance_facsimile_images)}
  it { should have_many(:dance_translations)}
  it { should belong_to(:dance)}
  it { should belong_to(:dance_source)}
end

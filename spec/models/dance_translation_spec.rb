require 'rails_helper'

RSpec.describe DanceTranslation, type: :model do
  it { should belong_to(:dance_source_content)}
end

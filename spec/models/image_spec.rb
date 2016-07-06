require 'rails_helper'
RSpec.describe Image, type: :model do
  it { should belong_to(:book_content)}
  it { should belong_to(:manuscript_content)}
end

RSpec.describe Image, "validations" do
  it { is_expected.to validate_presence_of(:name) }
end


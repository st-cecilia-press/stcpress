class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :piece

  validates :tag, :piece, presence: true
end

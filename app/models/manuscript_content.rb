class ManuscriptContent < ActiveRecord::Base
  belongs_to :manuscript
  belongs_to :piece
  has_many :images

  
  validates :manuscript, :piece, presence: true  
end

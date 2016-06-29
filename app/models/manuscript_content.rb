class ManuscriptContent < ActiveRecord::Base
  belongs_to :manuscript
  belongs_to :piece

  
  validates :manuscript, :piece, presence: true  
end

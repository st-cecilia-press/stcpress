class ManuscriptContent < ActiveRecord::Base
  belongs_to :manuscript
  belongs_to :piece
  has_many :images, dependent: :destroy

  
  validates :manuscript, :piece, presence: true  

  def diamm_link
    unless diamm.blank?
      return "https://www.diamm.ac.uk/compositions/#{self.diamm}"
    end
  end
end

class ManuscriptContent < ActiveRecord::Base
  belongs_to :manuscript
  belongs_to :piece
  has_many :images

  
  validates :manuscript, :piece, presence: true  

  def diamm_link
    unless diamm.blank?
      return "http://www.diamm.ac.uk/jsp/Descriptions?op=ITEM&itemKey=#{self.diamm}"
    end
  end
end

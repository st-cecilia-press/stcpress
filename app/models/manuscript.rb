class Manuscript < ActiveRecord::Base
  has_many :manuscript_contents, dependent: :destroy
  has_many :facsimile_sources, dependent: :destroy
  has_many :pieces, through: :manuscript_contents
  validates :name, :slug, presence: true  
  validates :slug, uniqueness: true  

  def diamm_link
    unless diamm.blank?
      return "http://www.diamm.ac.uk/jsp/Descriptions?op=SOURCE&sourceKey=#{self.diamm}"
    end
  end
end


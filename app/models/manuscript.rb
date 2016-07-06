class Manuscript < ActiveRecord::Base
  has_many :manuscript_contents
  has_many :pieces, through: :manuscript_contents
  validates :name, :slug, presence: true  
  validates :slug, uniqueness: true  
end

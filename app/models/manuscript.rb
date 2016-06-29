class Manuscript < ActiveRecord::Base
  has_many :manuscript_contents
  has_many :pieces, through: :manuscript_contents
  validates :name, presence: true  
end

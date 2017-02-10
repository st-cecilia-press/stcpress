class Book < ActiveRecord::Base
  has_many :book_contents
  has_many :facsimile_sources
  has_many :pieces, through: :book_contents
  validates :title, :slug, presence: true  
  validates :slug, uniqueness: true  
end

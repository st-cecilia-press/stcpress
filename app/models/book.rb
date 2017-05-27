class Book < ActiveRecord::Base
  has_many :book_contents, dependent: :destroy
  has_many :facsimile_sources, dependent: :destroy
  has_many :pieces, through: :book_contents
  validates :title, :slug, presence: true  
  validates :slug, uniqueness: true  
end

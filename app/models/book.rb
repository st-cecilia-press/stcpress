class Book < ActiveRecord::Base
  has_many :book_contents
  has_many :pieces, through: :book_contents
  validates :title, presence: true  
end

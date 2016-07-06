class BookContent < ActiveRecord::Base
  belongs_to :piece
  belongs_to :book
  has_many :images
  validates :book, :piece, presence: true  
end

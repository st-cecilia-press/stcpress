class BookContent < ActiveRecord::Base
  belongs_to :piece
  belongs_to :book
  validates :book, :piece, presence: true  
end

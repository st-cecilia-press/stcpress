class Piece < ActiveRecord::Base
  belongs_to :composer
  validates :title, :composer, presence: true  
end

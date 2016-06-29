class Piece < ActiveRecord::Base
  has_many :manuscript_contents
  has_many :manuscripts, through: :manuscript_contents

  has_many :book_contents
  has_many :books, through: :book_contents

  belongs_to :composer
  validates :title, :composer, :repo, :slug, presence: true  
end

class Publicationship < ActiveRecord::Base
  belongs_to :piece
  belongs_to :repository

  validates :repository, :piece, presence: true
end

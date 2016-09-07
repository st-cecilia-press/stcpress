class PieceLanguage < ActiveRecord::Base
  belongs_to :language
  belongs_to :piece

  validates :language, :piece, presence: true
end

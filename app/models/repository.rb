class Repository < ActiveRecord::Base
  has_many :publicationships
  has_many :pieces, through: :publicationships
  validates :name, presence: true

  scope :individual_pieces, -> {where(type: 'IndividualPieces')}
  scope :instrumental_book, -> {where(type: 'InstrumentalBook')}

  def editions(piece)
        raise 'Abstract Method'
  end
end

class Language < ActiveRecord::Base
  has_many :piece_languages
  has_many :pieces, through: :piece_languages

  validates :name, presence: true
end

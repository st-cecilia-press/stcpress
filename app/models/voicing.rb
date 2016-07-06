class Voicing < ActiveRecord::Base
  has_many :song_voicings
  has_many :pieces, through: :song_voicings

  validates :name, presence: true
end

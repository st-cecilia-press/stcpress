class SongVoicing < ActiveRecord::Base
  belongs_to :voicing
  belongs_to :piece

  validates :voicing, :piece, presence: true
end

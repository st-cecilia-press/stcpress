class SheetMusic < ActiveRecord::Base
  has_many :music_files, dependent: :destroy
end

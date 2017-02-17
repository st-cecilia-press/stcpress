class DanceSource < ActiveRecord::Base
  has_many :dance_source_contents
  has_many :dances, through: :dance_source_contents
end

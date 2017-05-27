class DanceSource < ActiveRecord::Base
  has_many :dance_source_contents, dependent: :destroy
  has_many :dances, through: :dance_source_contents
end

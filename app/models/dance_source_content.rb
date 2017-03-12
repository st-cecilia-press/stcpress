class DanceSourceContent < ActiveRecord::Base
  belongs_to :dance
  belongs_to :dance_source
  has_many :dance_facsimile_images
  has_many :dance_translations
end

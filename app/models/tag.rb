class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :pieces, through: :taggings

  validates :name, presence: true
end

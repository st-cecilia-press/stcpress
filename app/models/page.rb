class Page < ActiveRecord::Base
  validates :slug, presence: true
  validates :slug, uniqueness: true
end

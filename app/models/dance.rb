class Dance < ActiveRecord::Base
  belongs_to :dance_category 
  belongs_to :person
  has_many :instructions, dependent: :destroy
  has_many :dance_source_contents, dependent: :destroy
  has_many :dance_sources, through: :dance_source_contents
end

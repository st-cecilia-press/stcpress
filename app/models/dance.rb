class Dance < ActiveRecord::Base
  belongs_to :dance_category 
  belongs_to :person
  has_many :instructions
  has_many :dance_source_contents
  has_many :dance_sources, through: :dance_source_contents
end

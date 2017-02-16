class Dance < ActiveRecord::Base
  belongs_to :dance_category 
  belongs_to :person
  has_many :instructions
end

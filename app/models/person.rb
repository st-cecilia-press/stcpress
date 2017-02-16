class Person < ActiveRecord::Base
  has_many :dances
  has_many :instructions
end

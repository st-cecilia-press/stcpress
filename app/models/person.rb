class Person < ActiveRecord::Base
  has_many :dances, dependent: :destroy
  has_many :instructions, dependent: :destroy
end

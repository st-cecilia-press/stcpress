class Composer < ActiveRecord::Base
  has_many :pieces

  validates :name, presence: true

  def slug
    return self.name.tr(' ', '_')
  end  
end

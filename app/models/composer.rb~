class Composer < ActiveRecord::Base
  has_many :pieces

  validates :name, presence: true

  def slug
    return self.name.tr(' ', '_')
  end  

  def url
    return "/composers/#{self.slug}"
  end
end

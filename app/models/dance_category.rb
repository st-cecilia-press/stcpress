class DanceCategory < ActiveRecord::Base
  has_many :dances

  def slug
    return self.name.tr(' ', '_')
  end  

  def url
    return "/dance_categories/#{self.slug}"
  end
end

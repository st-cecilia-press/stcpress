class Piece < ActiveRecord::Base
  has_many :manuscript_contents
  has_many :manuscripts, through: :manuscript_contents

  has_many :book_contents
  has_many :books, through: :book_contents

  has_many :song_voicings
  has_many :voicings, through: :song_voicings

  has_many :publicationships
  has_many :repositories, through: :publicationships

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :piece_languages
  has_many :languages, through: :piece_languages

  belongs_to :composer
  validates :title, :composer, :slug, presence: true  

  def url
    return "/pieces/#{self.slug}"
  end

  def image_repo
      if self.repositories.find_by(slug: 'miscellaneous')
          return 'miscellaneous'
      else
          return self.repositories.first.slug
      end
  end

  def date
    if self.start_date == 0
      return ''  
    elsif self.start_date == self.end_date
      return self.start_date.to_s
    elsif self.start_date/100 == self.end_date/100
      return "#{ordinal(self.start_date/100 + 1)} century"
    else
      return "#{ordinal(self.start_date/100 + 1)} - #{ordinal(self.end_date/100 + 1)} century"
    end 
  end

  def ordinal(n)
    ending = case n % 100
             when 11, 12, 13 then 'th'
             else
               case n % 10
               when 1 then 'st'
               when 2 then 'nd'
               when 3 then 'rd'
               else 'th'
               end
             end

    "#{n}#{ending}"
  end
end

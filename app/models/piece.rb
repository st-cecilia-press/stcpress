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
end

class Image < ActiveRecord::Base
  belongs_to :book_content
  belongs_to :manuscript_content
  validates :name, presence: true
end

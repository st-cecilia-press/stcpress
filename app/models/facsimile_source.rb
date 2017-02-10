class FacsimileSource < ActiveRecord::Base
  belongs_to :manuscript
  belongs_to :book
end

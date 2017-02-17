class DanceSourceContent < ActiveRecord::Base
  belongs_to :dance
  belongs_to :dance_source
end

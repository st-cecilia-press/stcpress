class Voicing < ActiveRecord::Base
  has_many :song_voicings
  has_many :pieces, through: :song_voicings

  validates :name, presence: true
end
public
def weigh_voicing
  return self.name.gsub('S','1').gsub('A','2').gsub('T','3').gsub('B','4')
end

def num_parts
    if self.name == 'Heterophonic'
        return '1'
    else
        return self.name.length.to_s
    end
end

class Ensemble < ActiveRecord::Base
  has_many :audio_recordings

  def dances
    dances = []
    self.audio_recordings.each do |audio|
      audio.instructions.each do |i|
        dances.push(i.dance)
      end  
    end
    return dances.uniq
  end
end

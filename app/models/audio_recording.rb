class AudioRecording < ActiveRecord::Base
  belongs_to :ensemble
  has_many :instruction_audios 
  has_many :instructions, through: :instruction_audios
end

class InstructionAudio < ActiveRecord::Base
  belongs_to :audio_recording
  belongs_to :instruction
end

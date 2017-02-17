class InstructionSheetmusic < ActiveRecord::Base
  belongs_to :sheet_music
  belongs_to :instruction
end

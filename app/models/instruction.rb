class Instruction < ActiveRecord::Base
  belongs_to :dance
  belongs_to :person
  belongs_to :instruction_type
  has_many :instruction_audios
  has_many :audio_recordings, through: :instruction_audios
  has_many :instruction_sheetmusics
  has_many :sheet_musics, through: :instruction_sheetmusics
end

class Instruction < ActiveRecord::Base
  belongs_to :dance
  belongs_to :person
  belongs_to :instruction_type
  has_many :video_recordings, dependent: :destroy
  has_many :instruction_audios, dependent: :destroy
  has_many :audio_recordings, through: :instruction_audios
  has_many :instruction_sheetmusics, dependent: :destroy
  has_many :sheet_musics, through: :instruction_sheetmusics
end

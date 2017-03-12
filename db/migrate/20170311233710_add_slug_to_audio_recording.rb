class AddSlugToAudioRecording < ActiveRecord::Migration
  def change
    add_column :audio_recordings, :slug, :string
  end
end

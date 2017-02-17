class AddInstructionToVideoRecording < ActiveRecord::Migration
  def change
    add_reference :video_recordings, :instruction, index: true, foreign_key: true
  end
end

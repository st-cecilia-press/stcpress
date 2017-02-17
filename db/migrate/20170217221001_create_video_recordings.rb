class CreateVideoRecordings < ActiveRecord::Migration
  def change
    create_table :video_recordings do |t|
      t.string :name
      t.string :youtube

      t.timestamps null: false
    end
  end
end

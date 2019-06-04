class AddRecordingUuidToRecordings < ActiveRecord::Migration[5.2]
  def change
    add_column :recordings, :recording_uuid, :string
  end
end

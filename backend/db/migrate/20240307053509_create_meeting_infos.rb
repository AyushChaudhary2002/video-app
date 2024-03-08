class CreateMeetingInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :meeting_infos do |t|
      t.uuid :uuid_column

      t.timestamps
    end
  end
end

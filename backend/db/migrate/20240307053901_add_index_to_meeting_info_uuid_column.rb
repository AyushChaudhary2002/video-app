class AddIndexToMeetingInfoUuidColumn < ActiveRecord::Migration[6.1]
  def change
    add_index :meeting_infos, :uuid_column, using: :btree
  end
end

class RenameUuidColumnToUuidInMeetingInfo < ActiveRecord::Migration[6.1]
  def change
    rename_column :meeting_infos, :uuid_column, :uuid
  end
end

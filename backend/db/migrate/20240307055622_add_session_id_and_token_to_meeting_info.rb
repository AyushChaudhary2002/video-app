class AddSessionIdAndTokenToMeetingInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :meeting_infos, :session_id, :string
    add_column :meeting_infos, :token, :string
  end
end

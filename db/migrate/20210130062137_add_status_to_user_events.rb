class AddStatusToUserEvents < ActiveRecord::Migration
  def change
  	add_column :user_events, :status, :string
  end
end

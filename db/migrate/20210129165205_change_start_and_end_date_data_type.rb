class ChangeStartAndEndDateDataType < ActiveRecord::Migration
  def change
  	change_column :user_events, :start_date, :string
  	change_column :user_events, :end_date, :string
  end
end

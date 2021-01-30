class CreateUserEventsTable < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.string :name
      t.string :description
      t.string :location
      t.date :start_date
      t.date :end_date
      t.integer :duration
    end
  end
end

json.extract! user_event, :id, :name, :description, :location, :start_date, :end_date, :duration, :created_at, :updated_at
json.url user_event_url(user_event, format: :json)

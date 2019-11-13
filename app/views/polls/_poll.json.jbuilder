json.extract! poll, :id, :name, :event_date, :address, :owner_id, :created_at, :updated_at
json.url poll_url(poll, format: :json)

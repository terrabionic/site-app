json.extract! event_monitor, :id, :title, :start_at, :end_at, :allDay, :address, :website, :created_at, :updated_at
json.url event_monitor_url(event_monitor, format: :json)
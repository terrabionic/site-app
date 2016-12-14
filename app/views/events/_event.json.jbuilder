json.extract! event, :id, :title, :start_at, :end_at, :allDay, :name_exhibitor, :level_id, :hours, :price, :created_at, :updated_at
json.url event_url(event, format: :json)
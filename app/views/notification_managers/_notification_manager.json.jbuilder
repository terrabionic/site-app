json.extract! notification_manager, :id, :title, :event_id, :notice_id, :date_pub, :sector_id, :created_at, :updated_at
json.url notification_manager_url(notification_manager, format: :json)
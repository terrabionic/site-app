json.extract! notification, :id, :title, :event_id, :notice_id, :date_pub, :user_id, :user_read, :created_at, :updated_at
json.url notification_url(notification, format: :json)
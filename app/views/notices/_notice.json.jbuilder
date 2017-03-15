json.extract! notice, :id, :title, :link, :sector_id, :description, :active, :date_pub, :created_at, :updated_at
json.url notice_url(notice, format: :json)
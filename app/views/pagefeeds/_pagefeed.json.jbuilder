json.extract! pagefeed, :id, :title, :link, :sector_id, :created_at, :updated_at
json.url pagefeed_url(pagefeed, format: :json)
json.extract! login_manager, :id, :email_contact, :about_us, :privacy, :we_do, :created_at, :updated_at
json.url login_manager_url(login_manager, format: :json)
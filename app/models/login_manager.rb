class LoginManager < ActiveRecord::Base
	validates :email_contact, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end

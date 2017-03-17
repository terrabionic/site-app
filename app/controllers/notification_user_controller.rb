class NotificationUserController < ApplicationController

	def index_notification_user_first
		@user = current_user
	    @notifications = []
	    @notifications = Notification.where('user_id = ?',@user.id).limit(10).order("created_at ASC")
	end
end

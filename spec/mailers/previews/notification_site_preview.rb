# Preview all emails at http://localhost:3000/rails/mailers/notification_site
class NotificationSitePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_site/notify_invitation
  def notify_invitation
    NotificationSite.notify_invitation
  end

end

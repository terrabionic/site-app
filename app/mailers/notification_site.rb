class NotificationSite < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_site.notify_invitation.subject
  #
  default from: 'informacion@grupoaltegra.com.mx'
  def notify_invitation(user)
  	@user = user
    @greeting = "Hi"
    @url  = 'http://Site.com'
    mail to: @user.email, subject: "Bienvenido a Site"
  end
end

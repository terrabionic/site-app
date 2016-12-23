class NotificationSite < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_site.notify_invitation.subject
  #
  default from: 'informacion@grupoaltegra.com.mx'
  def notify_invitation(user, pass, current_user)
  	@user = user
    @pass = pass
    @current_user = current_user
    @greeting = "Hi"
    #@url  = 'http://Site.com'
    @url  = 'http://162.243.75.86:3000'
    mail to: @user.email, subject: "Bienvenido a Site"
  end
  
  def notify_contact(contact)
  	@contact = contact
    @login_manager = LoginManager.first
    unless @login_manager
		@login_manager = LoginManager.create()
    end
    #@url  = 'http://Site.com'
    @url  = 'http://162.243.75.86:3000'
    mail to: @login_manager.email_contact, subject: @contact.subject
  end
  
end

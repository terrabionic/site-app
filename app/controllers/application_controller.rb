class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to questions_url, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  # Metodo para enviar a la pagina segun su perfil
  def after_sign_in_path_for(resource)
    @user = current_user
    if @user.role == 'admin'
      sectors_path
    else
      companies_path
    end
  end

end

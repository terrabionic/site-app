class SectionsController < ApplicationController

  add_breadcrumb "Inicio", :root_path

  def index
    @login_manager = LoginManager.first
    unless @login_manager
		@login_manager = LoginManager.create()
    end
  end

end

class LoginManagersController < ApplicationController
  before_action :set_login_manager, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Administrador de Secciones", :sections_index_path

  # GET /login_managers
  # GET /login_managers.json
  def index
    @login_managers = LoginManager.all
  end

  # GET /login_managers/1
  # GET /login_managers/1.json
  def show
	@login_manager = LoginManager.first
  end

  # GET /login_managers/new
  def new
    @login_manager = LoginManager.new
  end

  # GET /login_managers/1/edit
  def edit
  end

  # POST /login_managers
  # POST /login_managers.json
  def create
    @login_manager = LoginManager.new(login_manager_params)

    respond_to do |format|
      if @login_manager.save
        format.html { redirect_to @login_manager, notice: '' }
        format.json { render :show, status: :created, location: @login_manager }
      else
        format.html { render :new }
        format.json { render json: @login_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /login_managers/1
  # PATCH/PUT /login_managers/1.json
  def update
    respond_to do |format|
      if @login_manager.update(login_manager_params)
        format.html { redirect_to sections_index_path }
      else
        format.html { render :edit }
        format.json { render json: @login_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /login_managers/1
  # DELETE /login_managers/1.json
  def destroy
    @login_manager.destroy
    respond_to do |format|
      format.html { redirect_to login_managers_url, notice: '' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login_manager
		@login_manager = LoginManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_manager_params
      params.require(:login_manager).permit(:email_contact, :about_us, :privacy, :we_do)
    end
end

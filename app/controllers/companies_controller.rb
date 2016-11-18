class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :edit_site, :update, :destroy, :create_user, :asign_agent_company, :update_user_company]
  after_action :update_user_company, only:[:update]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    if params[:search]
      if params[:sort]
        @companies = Company.search(params[:search]).order("? DESC",params[:sort])
      else
        @companies = Company.search(params[:search]).order("created_at DESC")
      end
    else
      @companies = Company.all.order('created_at DESC')
    end
    @sectors = Sector.all
    @users = User.all
    @roles = Role.all
    @surveys = Survey.all
    @categories = Category.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show

  end

  def show_general
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    authorize! :update, @company
  end

  def edit_site
    authorize! :update, @company
  end

  def show_reply
    @user = current_user
    @replies = Reply.where("user_id = ?", @user.id)
    if @replies.length > 0
      redirect_to survey_reply_path(survey_id:@replies.survey, id: @replies[0])
    else
      @survey = Survey.first
      redirect_to new_survey_reply_path(survey_id:@survey)
    end
    
    #@company = @user.companies.build(company_params)
  end

  # POST /companies
  # POST /companies.json
  def create
    #@company = Company.new(company_params)
    @user = current_user
    @company = @user.companies.build(company_params)
    if @company.save
      create_user
    end
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'La Empresa se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        registration_completed
        format.html { redirect_to @company, notice: 'La Empresa se ha actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_user_company
    if @company.user_login
      @user_login = User.find(@company.user_login)
      if @user_login.email != @company.email_user
        @user_login.email = @company.email_user
      end
      if @user_login.name != @company.name
        @user_login.name = @company.name
      end
      @user_login.save
    else
      create_user
    end
  end

  def registration_completed
    if not @company.completed
      if @company.company_type.length > 0 && @company.vat.length > 0 && @company.street.length > 0 && @company.street2.length > 0 && @company.city.length > 0 && @company.cel.length > 0 && @company.date_start && @company.line_business.length > 0 && @company.num_workers > 0 && @company.annual_sales.length > 0 && @company.company_history.length > 0 && @company.company_products.length > 0 && @company.company_market.length > 0 && @company.company_problems.length > 0 && @company.name_director.length > 0 && @company.staff_interviewed.length > 0 && @company.survey_period.length > 0 && @company.name_created.length > 0
        #if @company.company_type.length > 0
        @company.completed = true
        @company.save
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'La Empresa se ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  def deactivate
    @company = Company.find(params[:company_id])
    @company.active = false
    @company.save
    respond_to do |format|
      format.html { redirect_to company_url(@company), notice: 'La Empresa se ha desactivado.' }
      format.json { head :no_content }
    end
  end

  def action_activate
    @company = Company.find(params[:company_id])
    @company.active = true
    @company.save
    respond_to do |format|
      format.html { redirect_to company_url(@company), notice: 'La Empresa se ha activado correctamente.' }
      format.json { head :no_content }
    end
  end

  def create_user
    @role_company = Role.where("role = ?", 'company')
    if @role_company.length > 0
      @role_company = @role_company[0]
    else
      @role_company = Role.create(name: 'Compañia' , role:'company')
    end
    user_id = User.create(name: @company.name ,email:@company.email_user, password:"123456", password_confirmation: '123456', role: @role_company )
    @company.user_login = user_id
    @company.save
  end

  def asign_agent_company

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:company_name, :role, :address, :phone, :email, :name_agent, :state, :sector_id, :name, :email_user, :active, :agent_id, :company_type, :vat, :street, :street2, :city, :cel, :date_start, :date_end, :line_business, :num_workers, :annual_sales, :company_history, :company_products, :company_market, :company_problems, :name_director, :staff_interviewed, :survey_period, :name_created, :completed, :stage, :emprered)
    end
end

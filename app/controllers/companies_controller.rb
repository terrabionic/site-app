class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy, :create_user, :asign_agent_company, :update_user_company]
  after_action :update_user_company, only:[:update]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    @sectors = Sector.all
    @users = User.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show

  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    authorize! :update, @company
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
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
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
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_user_company
    @user_login = User.find(@company.user_login)
    if @user_login.email != @company.email_user
      @user_login.email = @company.email_user
    end
    if @user_login.name != @company.name
      @user_login.name = @company.name
    end
    @user_login.save
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
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def deactivate
    @company = Company.find(params[:company_id])
    @company.active = false
    @company.save
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully deactivate.' }
      format.json { head :no_content }
    end
  end

  def action_activate
    @company = Company.find(params[:company_id])
    @company.active = true
    @company.save
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully activate.' }
      format.json { head :no_content }
    end
  end

  def create_user
    user_id = User.create(name: @company.name ,email:@company.email_user, password:"123456", password_confirmation: '123456', role:'company')
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
      params.require(:company).permit(:company_name, :role, :address, :phone, :email, :name_agent, :state, :sector_id, :name, :email_user, :active, :agent_id, :company_type, :vat, :street, :street2, :city, :cel, :date_start, :line_business, :num_workers, :annual_sales, :company_history, :company_products, :company_market, :company_problems, :name_director, :staff_interviewed, :survey_period, :name_created, :completed)
    end
end
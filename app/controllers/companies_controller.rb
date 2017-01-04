class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :edit_site, :update, :destroy, :create_user, :asign_agent_company, :update_user_company, :get_survey_analysis, :get_report_IC_pdf]
  after_action :update_user_company, only:[:update]
  
  add_breadcrumb "Inicio", :root_path

  # GET /companies
  # GET /companies.json
  def index
    #@companies = Company.all
    if params[:search]
      if params[:order]
        if params[:order] == 'sector_id'
          @companies = Company.joins(:sector).search(params[:search]).order(" name DESC")
        else
          @companies = Company.search(params[:search]).order("? DESC",params[:order])
        end
      else
        @companies = Company.search(params[:search]).order("created_at DESC")
      end
    else
      if params[:order]
        if params[:order] == 'sector_id'
          
          @companies = Company.joins(:sector).order(" name DESC")
        else
          @companies = Company.all.order("? DESC",params[:order])
        end
      else
        @companies = Company.all
      end
    end
    @login_manager = LoginManager.first
    unless @login_manager
		@login_manager = LoginManager.create()
    end
    @sectors = Sector.all
    @users = User.all
    @roles = Role.all
    @surveys = Survey.all
    @categories = Category.all
    respond_to do |format|
		format.html
		format.csv { send_data @companies.to_csv }
    format.xlsx {
      response.headers['Content-Disposition'] = 'attachment; filename="Compañias.xlsx"'
    }
		#format.xls # { send_data @products.to_csv(col_sep: "\t") }
	  end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    if @company.survey_analysis
      @survey_analysis = @company.survey_analysis
      @categories = get_categories(@survey_analysis.reply.survey)
      unless @survey_analysis.date_print
        @survey_analysis.date_print = Time.now
        @survey_analysis.save
      end
    end
    add_breadcrumb @company.company_name, company_path(@company)
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render  template: 'companies/report_ic',
                pdf: 'file_name',
                viewport_size: '1280x1024'
      end
    end
  end

  def get_report_IC_pdf
    @company = Company.find(params[:id])
    @survey_analysis = @company.survey_analysis
    unless @survey_analysis.date_print
      @survey_analysis.date_print = Time.now
      @survey_analysis.save
    end
    @categories = get_categories(@survey_analysis.reply.survey)
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render  template: 'companies/report_ic',
                pdf: 'file_name',
                viewport_size: '1280x1024'
      end
    end
  end

  def get_categories(survey)
    #~ @company_ids = Company.where("user_login_id = ?", self.id)
    @categories = Question.where("survey_id = ?",survey).map{|s| s.category}
    if @categories
      @categories = @categories.uniq
      return @categories
    end
    return false
  end

  def show_general
    @company = Company.find(params[:id])
    add_breadcrumb @company.company_name, show_general_path(@company)
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    authorize! :update, @company
    add_breadcrumb @company.company_name, company_path(@company)
    add_breadcrumb "Editar " + @company.company_name, edit_company_path(@company)
  end

  def edit_site
    authorize! :update, @company
    add_breadcrumb @company.company_name, company_path(@company)
    add_breadcrumb "Editar Site " + @company.company_name, edit_company_path(@company)
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
    t_start =Time.now
    t_end = t_start + 345600
    @company.date_start = t_start
    @company.date_end = t_end
    if @company.save
      create_user
    end
    respond_to do |format|
      if @company.save
        format.html { redirect_to root_path, notice: 'La Empresa se ha creado correctamente.' }
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
      if @company.company_type.length > 0 && @company.vat.length > 0 && @company.street.length > 0 && @company.street2.length > 0 && @company.latitude.length > 0 && @company.longitude.length > 0  && @company.cel.length > 0 && @company.date_start && @company.line_business.length > 0 && @company.num_workers > 0 && @company.annual_sales.length > 0 && @company.company_history.length > 0 && @company.company_products.length > 0 && @company.company_market.length > 0 && @company.company_problems.length > 0 && @company.name_director.length > 0 && @company.staff_interviewed.length > 0 && @company.survey_period.length > 0 && @company.name_created.length > 0
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

  def get_survey_analysis
    if @company.survey_analysis
      redirect_to survey_analysis_path(@company.survey_analysis)
    else
      @replies = Reply.where("user_id = ?", @company.user_login.id)
      if @replies.length > 0
        @reply = @replies[0]
      else
        redirect_to root_path
      end
      @companies_count = Company.where("active = ?",true )
      @analysis = SurveyAnalysis.create(agente:current_user,user_company:@company.user_login,reply_id:@reply.id, num_company: @companies_count.length)
      @company.survey_analysis = @analysis
      @company.stage = 'Analisis'
      @company.save
      redirect_to survey_analysis_path(@analysis)
    end
  end

  def crate_password
    pass = ''
    for i in 0..5
      num = rand(9).to_s
      pass = pass +''+num
    end
    return pass
  end

  def action_send_invitation
    @company = Company.find(params[:id])
    if @company.completed 
      if @company.stage == 'Prealta'
        if @company.state == 'Nuevo'
          action_progress
        end
        @company.stage = 'Alta'
        t_start =Time.now
        t_end = t_start + 345600
        @company.date_start = t_start
        @company.date_end = t_end
      end
      pass = crate_password
      @company.user_login.password = pass
      @company.user_login.password_confirmation = pass
      @company.user_login.save
      @company.save
      
      NotificationSite.notify_invitation(@company.user_login, pass, current_user).deliver_now
    end
    redirect_to company_path(id: params[:id])
  end

  def action_progress
    @company = Company.find(params[:id])
    @company.state = 'Progreso'
    @company.save
  end

  def action_delayed
    @company = Company.find(params[:id])
    @company.state = 'Retrasado'
    @company.save
  end

  def action_done
    @company = Company.find(params[:id])
    @company.state = 'Terminado'
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
      params.require(:company).permit(:company_name, :municipio_id , :activity_id, :role, :address, :phone, :email, :name_agent, :state, :sector_id, :name, :email_user, :active, :agent_id, :company_type, :vat, :street, :street2, :city, :cel, :date_start, :date_end, :line_business, :num_workers, :annual_sales, :company_history, :company_products, :company_market, :company_problems, :name_director, :staff_interviewed, :survey_period, :name_created, :completed, :stage, :emprered, :image_logo, :survey_analysis, :longitude, :latitude)
    end
end

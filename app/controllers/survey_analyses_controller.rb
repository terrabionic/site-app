class SurveyAnalysesController < ApplicationController
  before_action :set_survey_analysis, only: [:show, :edit, :update, :destroy, :analysis_done]

  # GET /survey_analyses
  # GET /survey_analyses.json
  def index
    @survey_analyses = SurveyAnalysis.all
  end

  # GET /survey_analyses/1
  # GET /survey_analyses/1.json
  def show
    @categories = get_categories(@survey_analysis.reply.survey)
  end

  # GET /survey_analyses/new
  def new
    @survey_analysis = SurveyAnalysis.new
  end

  # GET /survey_analyses/1/edit
  def edit
    @categories = get_categories(@survey_analysis.reply.survey)
  end

  # POST /survey_analyses
  # POST /survey_analyses.json
  def create
    @survey_analysis = SurveyAnalysis.new(survey_analysis_params)

    respond_to do |format|
      if @survey_analysis.save
        format.html { redirect_to @survey_analysis, notice: 'Survey analysis was successfully created.' }
        format.json { render :show, status: :created, location: @survey_analysis }
      else
        format.html { render :new }
        format.json { render json: @survey_analysis.errors, status: :unprocessable_entity }
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

  # PATCH/PUT /survey_analyses/1
  # PATCH/PUT /survey_analyses/1.json
  def update
    respond_to do |format|
      if @survey_analysis.update(survey_analysis_params)
        format.html { redirect_to @survey_analysis, notice: 'Survey analysis was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_analysis }
      else
        format.html { render :edit }
        format.json { render json: @survey_analysis.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /survey_analyses/1
  # DELETE /survey_analyses/1.json
  def destroy
    @survey_analysis.destroy
    respond_to do |format|
      format.html { redirect_to survey_analyses_url, notice: 'Survey analysis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def analysis_done
	@company = Company.find(@survey_analysis.user_company.company.id)
	@company.state = 'Terminado'
	@company.stage = 'Reporte'
	@company.save
	@companies_emprered = Company.where("emprered_id = ? and state <> ?",@company.emprered.id, 'Terminado')
	if @companies_emprered.length - 1 < @company.emprered.num_max_companies
		@company.emprered.available = true
		@company.emprered.save
	end
	@companies_agent = Company.where("agent_id = ? and state <> ?",@company.agent.id, 'Terminado')
	if @companies_agent.length - 1 < @company.agent.num_max_companies
		@company.agent.available = true
		@company.agent.save
	end
	redirect_to survey_analysis_path(@survey_analysis)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_analysis
      @survey_analysis = SurveyAnalysis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_analysis_params
      params.require(:survey_analysis).permit(:agente, :user_company, :reply, :organizational, :innovation_management, :innovation, :guilds, :copetential, :num_company, :create_jobs, :num_jobs, :num_emprered, :num_electronic_kiosk)
    end
end

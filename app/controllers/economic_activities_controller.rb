class EconomicActivitiesController < ApplicationController
  before_action :set_economic_activity, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb "Inicio", :root_path

  # GET /economic_activities
  # GET /economic_activities.json
  def index
    @economic_activities = EconomicActivity.all
    add_breadcrumb 'Actividades Económicas', economic_activities_path
  end

  # GET /economic_activities/1
  # GET /economic_activities/1.json
  def show
  end

  # GET /economic_activities/new
  def new
    @economic_activity = EconomicActivity.new
    add_breadcrumb 'Actividades Económicas', economic_activities_path
  end

  # GET /economic_activities/1/edit
  def edit
  add_breadcrumb 'Actividades Económicas', economic_activities_path
  add_breadcrumb 'Editar ' + @economic_activity.name, edit_economic_activity_path(@economic_activity)
  end

  # POST /economic_activities
  # POST /economic_activities.json
  def create
    @economic_activity = EconomicActivity.new(economic_activity_params)

    respond_to do |format|
      if @economic_activity.save
        format.html { redirect_to economic_activities_path }
        format.json { render :show, status: :created, location: @economic_activity }
      else
        format.html { render :new }
        format.json { render json: @economic_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /economic_activities/1
  # PATCH/PUT /economic_activities/1.json
  def update
    respond_to do |format|
      if @economic_activity.update(economic_activity_params)
        format.html { redirect_to economic_activities_path }
        format.json { render :show, status: :ok, location: @economic_activity }
      else
        format.html { render :edit }
        format.json { render json: @economic_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /economic_activities/1
  # DELETE /economic_activities/1.json
  def destroy
    @economic_activity.destroy
    respond_to do |format|
      format.html { redirect_to economic_activities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_economic_activity
      @economic_activity = EconomicActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def economic_activity_params
      params.require(:economic_activity).permit(:name)
    end
end

class TourManagersController < ApplicationController
  before_action :set_tour_manager, only: [:show, :edit, :update, :destroy]

  # GET /tour_managers
  # GET /tour_managers.json
  def index
    @tour_managers = TourManager.all
  end

  # GET /tour_managers/1
  # GET /tour_managers/1.json
  def show
  end

  # GET /tour_managers/new
  def new
    @tour_manager = TourManager.new
  end

  # GET /tour_managers/1/edit
  def edit
  end

  # POST /tour_managers
  # POST /tour_managers.json
  def create
    @tour_manager = TourManager.new(tour_manager_params)

    respond_to do |format|
      if @tour_manager.save
        format.html { redirect_to tour_managers_path, notice: '' }
      else
        format.html { render :new }
        format.json { render json: @tour_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_managers/1
  # PATCH/PUT /tour_managers/1.json
  def update
    respond_to do |format|
      if @tour_manager.update(tour_manager_params)
        format.html { redirect_to tour_managers_path, notice: '' }
      else
        format.html { render :edit }
        format.json { render json: @tour_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_managers/1
  # DELETE /tour_managers/1.json
  def destroy
    @tour_manager.destroy
    respond_to do |format|
      format.html { redirect_to tour_managers_url, notice: 'Tour manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_manager
      @tour_manager = TourManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_manager_params
      params.require(:tour_manager).permit(:welcom, :map, :filter_search, :first_step, :second_step, :third_step, :search_field)
    end
end

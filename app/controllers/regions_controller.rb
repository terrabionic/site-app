class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb "Inicio", :root_path

  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.all
    authorize! :read, @regions
    add_breadcrumb 'Regiones', regions_path
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
  authorize! :read, @region
  add_breadcrumb 'Regiones', regions_path
  add_breadcrumb @region.name, region_path(@region)
  end

  # GET /regions/new
  def new
    @region = Region.new
    authorize! :create, @region
    add_breadcrumb 'Regiones', regions_path
  end

  # GET /regions/1/edit
  def edit
  authorize! :update, @region
  add_breadcrumb 'Regiones', regions_path
  add_breadcrumb 'Editar '+ @region.name, edit_region_path(@region)
  end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to regions_path }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1
  # PATCH/PUT /regions/1.json
  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to regions_path }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(:name)
    end
end

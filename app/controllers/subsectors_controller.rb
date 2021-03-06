class SubsectorsController < ApplicationController
  before_action :set_subsector, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Administrador de Secciones", :sections_index_path

  # GET /subsectors
  # GET /subsectors.json
  def index
    @subsectors = Subsector.all
    add_breadcrumb "Subsectores", subsectors_path
  end

  # GET /subsectors/1
  # GET /subsectors/1.json
  def show
    add_breadcrumb "Subsectores", subsectors_path
    add_breadcrumb @subsector.name, subsector_path(@subsector)
  end

  # GET /subsectors/new
  def new
    @subsector = Subsector.new
    add_breadcrumb "Subsectores", subsectors_path
  end

  # GET /subsectors/1/edit
  def edit
    add_breadcrumb "Subsectores", subsectors_path
    add_breadcrumb @subsector.name, subsector_path(@subsector)
  end

  # POST /subsectors
  # POST /subsectors.json
  def create
    @subsector = Subsector.new(subsector_params)

    respond_to do |format|
      if @subsector.save
        format.html { redirect_to @subsector }
        format.json { render :show, status: :created, location: @subsector }
      else
        format.html { render :new }
        format.json { render json: @subsector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subsectors/1
  # PATCH/PUT /subsectors/1.json
  def update
    respond_to do |format|
      if @subsector.update(subsector_params)
        format.html { redirect_to @subsector}
        format.json { render :show, status: :ok, location: @subsector }
      else
        format.html { render :edit }
        format.json { render json: @subsector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subsectors/1
  # DELETE /subsectors/1.json
  def destroy
    @subsector.destroy
    respond_to do |format|
      format.html { redirect_to subsectors_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subsector
      @subsector = Subsector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subsector_params
      params.require(:subsector).permit(:name, :sector_id, :code)
    end
end

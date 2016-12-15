class SectorsController < ApplicationController
  before_action :set_sector, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb "Inicio", :root_path

  # GET /sectors
  # GET /sectors.json
  def index
    @sectors = Sector.all
    add_breadcrumb 'Sectores', sectors_path
    authorize! :read, @sectors
  end

  # GET /sectors/1
  # GET /sectors/1.json
  def show
  add_breadcrumb 'Sectores', sectors_path
  add_breadcrumb @sector.name, sector_path(@sector)
  end

  # GET /sectors/new
  def new
    @sector = Sector.new
  end

  # GET /sectors/1/edit
  def edit
    authorize! :update, @sector
    add_breadcrumb 'Sectores', sectors_path
    add_breadcrumb 'Editar ' + @sector.name, edit_sector_path(@sector)
  end

  # POST /sectors
  # POST /sectors.json
  def create
    @sector = Sector.new(sector_params)
    respond_to do |format|
      if @sector.save
        format.html { redirect_to @sector, notice: 'El Sector se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @sector }
      else
        format.html { render :new }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sectors/1
  # PATCH/PUT /sectors/1.json
  def update
    respond_to do |format|
      if @sector.update(sector_params)
        format.html { redirect_to @sector, notice: 'El Sector fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @sector }
      else
        format.html { render :edit }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sectors/1
  # DELETE /sectors/1.json
  def destroy
    @sector.destroy
    respond_to do |format|
      format.html { redirect_to sectors_url, notice: 'El Sector fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  def action_activate_deactivate
    @sector = Sector.find(params[:sector_id])
    if @sector.active == false
      @sector.active = true
    else
      @sector.active = false
    end
    @sector.save
    respond_to do |format|
      format.html { redirect_to sectors_url, notice: 'El Sector fue actualizado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sector
      @sector = Sector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sector_params
      params.require(:sector).permit(:name, :description, :image_sector, :image)
    end
end

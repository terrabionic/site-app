class MunicipiosController < ApplicationController
  before_action :set_municipio, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb "Inicio", :root_path

  # GET /municipios
  # GET /municipios.json
  def index
    @municipios = Municipio.all
    authorize! :read, @municipios
    add_breadcrumb 'Municipios', municipios_path
  end

  # GET /municipios/1
  # GET /municipios/1.json
  def show
	authorize! :read, @municipio
  end

  # GET /municipios/new
  def new
    @municipio = Municipio.new
    authorize! :create, @municipio
    add_breadcrumb 'Municipios', municipios_path
  end

  # GET /municipios/1/edit
  def edit
	authorize! :update, @municipio
	add_breadcrumb 'Municipios', municipios_path
	add_breadcrumb 'Editar ' + @municipio.name, edit_municipio_path(@municipio)
  end

  # POST /municipios
  # POST /municipios.json
  def create
    @municipio = Municipio.new(municipio_params)

    respond_to do |format|
      if @municipio.save
        format.html { redirect_to municipios_path }
        format.json { render :show, status: :created, location: @municipio }
      else
        format.html { render :new }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipios/1
  # PATCH/PUT /municipios/1.json
  def update
    respond_to do |format|
      if @municipio.update(municipio_params)
        format.html { redirect_to municipios_path }
        format.json { render :show, status: :ok, location: @municipio }
      else
        format.html { render :edit }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipios/1
  # DELETE /municipios/1.json
  def destroy
    @municipio.destroy
    respond_to do |format|
      format.html { redirect_to municipios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipio
      @municipio = Municipio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def municipio_params
      params.require(:municipio).permit(:name, :region_id)
    end
end

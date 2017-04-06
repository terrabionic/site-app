class TypesController < ApplicationController
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Administrador de Secciones", :sections_index_path

  # GET /types
  # GET /types.json
  def index
    @types = Type.all
    add_breadcrumb "Clases", types_path
  end

  # GET /types/1
  # GET /types/1.json
  def show
    add_breadcrumb "Clases", types_path
    add_breadcrumb @type.name, type_path(@type)
  end

  # GET /types/new
  def new
    @type = Type.new
    add_breadcrumb "Clases", types_path
  end

  # GET /types/1/edit
  def edit
    add_breadcrumb "Clases", types_path
    add_breadcrumb @type.name, type_path(@type)
  end

  # POST /types
  # POST /types.json
  def create
    @type = Type.new(type_params)

    respond_to do |format|
      if @type.save
        format.html { redirect_to @type }
        format.json { render :show, status: :created, location: @type }
      else
        format.html { render :new }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /types/1
  # PATCH/PUT /types/1.json
  def update
    respond_to do |format|
      if @type.update(type_params)
        format.html { redirect_to @type }
        format.json { render :show, status: :ok, location: @type }
      else
        format.html { render :edit }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @type.destroy
    respond_to do |format|
      format.html { redirect_to types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_params
      params.require(:type).permit(:name, :subbranch_id, :code)
    end
end

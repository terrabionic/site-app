class LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb "Inicio", :root_path

  # GET /levels
  # GET /levels.json
  def index
    @levels = Level.all
    authorize! :read, @levels
    add_breadcrumb 'Niveles de Cursos', levels_path
  end

  # GET /levels/1
  # GET /levels/1.json
  def show
  add_breadcrumb 'Niveles de Cursos', levels_path
  add_breadcrumb @level.title, level_path(@level)
  end

  # GET /levels/new
  def new
    @level = Level.new
    authorize! :create, @level
  end

  # GET /levels/1/edit
  def edit
	authorize! :update, @level
	add_breadcrumb 'Niveles de Cursos', levels_path
	add_breadcrumb 'Editar ' + @level.title, edit_level_path(@level)
  end

  # POST /levels
  # POST /levels.json
  def create
    @level = Level.new(level_params)

    respond_to do |format|
      if @level.save
        format.html { redirect_to levels_path, notice: '' }
        format.json { render :show, status: :created, location: @level }
      else
        format.html { render :new }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levels/1
  # PATCH/PUT /levels/1.json
  def update
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to levels_path, notice: '' }
        format.json { render :show, status: :ok, location: @level }
      else
        format.html { render :edit }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    @level.destroy
    respond_to do |format|
      format.html { redirect_to levels_url, notice: '' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      params.require(:level).permit(:title, :image)
    end
end

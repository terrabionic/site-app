class SubbranchesController < ApplicationController
  before_action :set_subbranch, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Administrador de Secciones", :sections_index_path

  # GET /subbranches
  # GET /subbranches.json
  def index
    @subbranches = Subbranch.all
    add_breadcrumb "Subramas", subbranches_path
  end

  # GET /subbranches/1
  # GET /subbranches/1.json
  def show
    add_breadcrumb "Subramas", subbranches_path
    add_breadcrumb @subbranch.name, subbranch_path(@subbranch)
  end

  # GET /subbranches/new
  def new
    @subbranch = Subbranch.new
    add_breadcrumb "Subramas", subbranches_path
  end

  # GET /subbranches/1/edit
  def edit
    add_breadcrumb "Subramas", subbranches_path
    add_breadcrumb @subbranch.name, subbranch_path(@subbranch)
  end

  # POST /subbranches
  # POST /subbranches.json
  def create
    @subbranch = Subbranch.new(subbranch_params)

    respond_to do |format|
      if @subbranch.save
        format.html { redirect_to @subbranch}
        format.json { render :show, status: :created, location: @subbranch }
      else
        format.html { render :new }
        format.json { render json: @subbranch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subbranches/1
  # PATCH/PUT /subbranches/1.json
  def update
    respond_to do |format|
      if @subbranch.update(subbranch_params)
        format.html { redirect_to @subbranch}
        format.json { render :show, status: :ok, location: @subbranch }
      else
        format.html { render :edit }
        format.json { render json: @subbranch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subbranches/1
  # DELETE /subbranches/1.json
  def destroy
    @subbranch.destroy
    respond_to do |format|
      format.html { redirect_to subbranches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subbranch
      @subbranch = Subbranch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subbranch_params
      params.require(:subbranch).permit(:name, :branch_id, :code)
    end
end

class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Administrador de Secciones", :sections_index_path

  # GET /branches
  # GET /branches.json
  def index
    @branches = Branch.all
    add_breadcrumb "Ramas", branches_path
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
    add_breadcrumb "Ramas", branches_path
    add_breadcrumb @branch.name, branch_path(@branch)
  end

  # GET /branches/new
  def new
    @branch = Branch.new
    add_breadcrumb "Ramas", branches_path
  end

  # GET /branches/1/edit
  def edit
    add_breadcrumb "Ramas", branches_path
    add_breadcrumb @branch.name, branch_path(@branch)
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to @branch }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to @branch}
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to branches_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(:name, :subsector_id, :code)
    end
end

class RolesController < ApplicationController
	before_action :set_role, only: [:show, :edit, :edit_permissions, :update, :destroy]
	
	add_breadcrumb "Home", :root_path

	def show
		add_breadcrumb 'Roles', roles_path
		add_breadcrumb @role.name, role_path(@role)
  	end

  	def index
  		@roles = Role.all
  		add_breadcrumb 'Roles', roles_path
  	end

  	def new
	    @role = Role.new
	    add_breadcrumb 'Roles', roles_path
	end

	def edit
		authorize! :update, @role
		add_breadcrumb 'Roles', roles_path
		add_breadcrumb @role.name, role_path(@role)
		add_breadcrumb 'Editar ' + @role.name, edit_role_path(@role)
	end

	def edit_permissions
		add_breadcrumb 'Roles', roles_path
		add_breadcrumb @role.name, role_path(@role)
		add_breadcrumb 'Editar Permisos' + @role.name, edit_role_path(@role)
	end

	def create
    	@role = Role.new(role_params)
    	@role.save
    	redirect_to @role
  	end

	def update
	  	@role.update(role_params)
	  	redirect_to @role
	end

  	def destroy
    	@role.destroy
    	redirect_to roles_path
  	end

  	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_role
	      @role = Role.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def role_params
	      params.require(:role).permit(:name, :description, :role)
	    end
end

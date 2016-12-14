class Role < ActiveRecord::Base
	ROLES = %w[admin agente emprered company].freeze

	validates :name, presence: true
	has_many :users, :dependent => :restrict_with_error

	def get_role_name( role )
		if role == 'admin'
			return 'Administrador'
		elsif role == 'agente'
			return 'Agente AE'
		elsif role == 'emprered'
			return 'Emprered'
		elsif role == 'company'
			return 'Compañia'
		else
			return 'Otro'
		end
  	end

  	def get_user_by_role( role_id )
  		#@companies = User.search(params[:search]).order("? DESC",params[:sort])length
  		#return 0
  		@users = User.where("role_id = ?", role_id)
  		if @users.length > 0
  			return @users.length
  		else
  			return 0
  		end
  	end
end

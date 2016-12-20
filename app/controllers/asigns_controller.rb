class AsignsController < ApplicationController
	
	add_breadcrumb "Inicio", :root_path
	
	def asign_agent
		@role_agente = Role.where("role = ?", 'agente')
		@agents = false
		if @role_agente.length > 0
			@agents = User.where("role_id = ?",@role_agente[0].id)
		end
		@company = Company.find(params[:id])
	end

	def action_asign
		@company = Company.find(params[:company_id])
		@user = User.find(params[:user_id])
		if @company.agent
			user_old = @company.agent
			@companies_agent_old = Company.where("agent_id = ? and state <> ?",user_old.id,'Terminado')
			if @companies_agent_old.length - 1 < user_old.num_max_companies
				user_old.available = true
				user_old.save
			end
		end
		@companies_agent = Company.where("agent_id = ? and state <> ?",@user.id,'Terminado')
		if @companies_agent.length + 1 >= @user.num_max_companies
			@user.available = false
			@user.save
		end
		@company.agent =  @user
		@company.save
		redirect_to companies_url
	end

	def asign_emprered
		
		@role_emprered = Role.where("role = ?", 'emprered')
		if @role_emprered.length > 0
			@emprereds = User.where("role_id = ?",@role_emprered[0].id)
		end
		@company = Company.find(params[:id])
		add_breadcrumb 'Cambiar ' + @company.company_name, asignar_emprered_path(@company)
	end

	def action_asign_emprered
		@company = Company.find(params[:company_id])
		@user = User.find(params[:user_id])
		if @company.emprered
			user_old = @company.emprered
			@companies_emprered_old = Company.where("emprered_id = ? and state <> ?",user_old.id, 'Terminado')
			if @companies_emprered_old.length - 1 < user_old.num_max_companies
				user_old.available = true
				user_old.save
			end
		end
		@companies_emprered = Company.where("emprered_id = ? and state <> ?",@user.id, 'Terminado')
		if @companies_emprered.length + 1 >= @user.num_max_companies
			@user.available = false
			@user.save
		end
		@company.emprered =  @user
		@company.save
		redirect_to companies_url
	end
end

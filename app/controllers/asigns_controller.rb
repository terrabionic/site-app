class AsignsController < ApplicationController
	def asign_agent
		@agents = User.where("role = 'agent'")
		@company = Company.find(params[:id])
	end

	def action_asign
		@company = Company.find(params[:company_id])
		@user = User.find(params[:user_id])
		if @company.agent
			user_old = @company.agent
			@companies_agent_old = Company.where("agent_id = ?",user_old.id)
			if @companies_agent_old.length - 1 < user_old.num_max_companies
				user_old.available = true
				user_old.save
			end
		end
		@companies_agent = Company.where("agent_id = ?",@user.id)
		if @companies_agent.length + 1 >= @user.num_max_companies
			@user.available = false
			@user.save
		end
		@company.agent =  @user
		@company.save
		redirect_to companies_url
	end

	def asign_emprered
		@emprereds = User.where("role = 'emprered'")
		@company = Company.find(params[:id])
	end

	def action_asign_emprered
		@company = Company.find(params[:company_id])
		@user = User.find(params[:user_id])
		if @company.emprered
			user_old = @company.emprered
			@companies_emprered_old = Company.where("emprered_id = ?",user_old.id)
			if @companies_emprered_old.length - 1 < user_old.num_max_companies
				user_old.available = true
				user_old.save
			end
		end
		@companies_emprered = Company.where("emprered_id = ?",@user.id)
		if @companies_emprered.length + 1 >= @user.num_max_companies
			@user.available = false
			@user.save
		end
		@company.emprered =  @user
		@company.save
		redirect_to companies_url
	end
end
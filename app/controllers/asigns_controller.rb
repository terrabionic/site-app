class AsignsController < ApplicationController
	def asign_agent
		@emprereds = User.where("role = 'emprered'")
		@agents = User.where("role = 'agent'")
		@company = Company.find(params[:id])
	end

	def action_asign
		@company = Company.find(params[:company_id])
		@user = User.find(params[:user_id])
		#update_attributes email: email_is
		@company.agent =  @user
		@company.save
		redirect_to companies_url
	end
end
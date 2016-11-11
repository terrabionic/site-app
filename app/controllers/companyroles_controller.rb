class CompanyrolesController < ApplicationController

	def index_emprered
		@companies = Company.all
	end

end

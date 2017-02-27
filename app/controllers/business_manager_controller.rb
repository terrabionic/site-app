class BusinessManagerController < ApplicationController

	def index_manager_user

		@user = current_user
		@municipios = []
		@companies = []
		level = params[:level]
		@hash = []
		if @user.company
			@sector = @user.company.sector
			if level == 'regional'
				if params[:location]
					@companies = Company.joins(:municipio).where("region_id = ? AND sector_id = ?", params[:location],@sector.id)
				end
				@municipios = Region.all
			elsif level == 'municipal'
				@municipios = Municipio.all
				@companies = Company.where("municipio_id = ? AND sector_id = ?", params[:location],@sector.id)
			else
				@municipios = []
				@companies = Company.where("sector_id = ?", @sector.id)
			end

			if @companies
				@hash = Gmaps4rails.build_markers(@companies) do |company, marker|
					marker.lat company.latitude
					marker.lng company.longitude
					marker.infowindow company.company_name
				end
			else
				@hash = Gmaps4rails.build_markers([@user.company]) do |company, marker|
					marker.lat company.latitude
					marker.lng company.longitude
					marker.infowindow company.company_name
				end
			end
		end
	end

	def index_manager_admin
		@municipios = []
		@companies = Company.all
		authorize! :read, @companies
		level = params[:level]
		@hash = []

		if level == 'regional'
			if params[:location]
				if params[:sector]
					@companies = Company.joins(:municipio).where("region_id = ? AND sector_id = ?", params[:location],params[:sector])
				else
					@companies = Company.joins(:municipio).where("region_id = ?", params[:location])
				end
			end
				@municipios = Region.all
		elsif level == 'municipal'
			@municipios = Municipio.all
			if params[:sector]
				@companies = Company.where("municipio_id = ? AND sector_id = ?", params[:location],params[:sector])
			else
				@companies = Company.where("municipio_id = ?", params[:location])
			end
		else
			@municipios = []
			if params[:sector]
				@companies = Company.where("sector_id = ?",params[:sector])
			else
				@companies = Company.all
			end
		end

		if @companies
			@hash = Gmaps4rails.build_markers(@companies) do |company, marker|
				marker.lat company.latitude
				marker.lng company.longitude
				marker.infowindow company.company_name
			end
		end
	end
end

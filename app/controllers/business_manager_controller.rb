class BusinessManagerController < ApplicationController

	def index_manager_user

		@user = current_user
		@municipios = []
		@companies = []
		@companies_states = []
		level = params[:level]
		@percentage_sector_region = 0.0
		@municipios_first_five = []
		@company_activities = []
		@hash = []
		@company_am = []
		@company_am_2 = []
		if @user.company
			@sector = @user.company.sector
			@companies_all = Company.all
			@municipios_first_five = Municipio.limit(5)
			@companies_states = Company.where("state_company_id = ? AND sector_id = ?", @user.company.state_company.id,@sector.id)
			@companies_sectors = Company.where("sector_id = ?", @sector.id)
			Company.where("sector_id = ?", @sector.id).group_by(&:activity).each do |activity, company_sectors|
				@company_activities.push(activity)
			end
			Municipio.all.each do |municipio|
				@company_activities.each do |activity|
					@companies_asm = Company.where("sector_id = ? AND municipio_id = ? AND activity_id = ?", @sector.id, municipio.id, activity.id)
					if @companies_asm.length > 0
						@company_am.push([activity, @companies_asm.length, @sector, municipio])
					end
				end
			end
			@company_am = @company_am.sort{ |a,b| b[1] <=> a[1]}
			count_company = 0
			@company_am.each do |companies_list|
				if count_company > 4
					break
				end
				@company_am_2.push(companies_list)
				count_company = count_company + 1
			end

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
		@company_am = []
		@company_am_2 = []
		@company_activities = []

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

		# TAGS NIVELES --------------------------------
		@companies_all = Company.all
		@companies_states = []
		if params[:location_municipal]
			if params[:location_municipal].length > 0
				@companies_all = Company.where("municipio_id = ? ", params[:location_municipal])
			end
		end
		if params[:sector_municipal]
			@sector_municipal = Sector.find(params[:sector_municipal])
			if params[:location_municipal]
				if params[:location_municipal].length > 0
					@companies_states = Company.where("municipio_id = ? AND sector_id = ?", params[:location_municipal],params[:sector_municipal])
				else
					@companies_states = Company.where("sector_id = ?", params[:sector_municipal])
				end
			else
				@companies_states = Company.where("sector_id = ?", params[:sector_municipal])
			end
		else
			@sector_municipal = Sector.first
			params[:sector_municipal] = @sector_municipal.id
			@companies_states = Company.where("sector_id = ?", params[:sector_municipal])
		end

		# REGIONAL
		if params[:locationr_region]
			if params[:locationr_region].length > 0
				@municipios_first_five = Municipio.where("region_id = ?",params[:locationr_region]).limit(5)
			else
				@municipios_first_five = Municipio.limit(5)
			end
		else
			@municipios_first_five = Municipio.limit(5)
		end

		# MUNICIPAL

		if params[:sector_mun]
			@sector_mun = Sector.find(params[:sector_mun])
			@companies_sectors_mun = Company.where("sector_id = ?", params[:sector_mun])
		else
			@sector_mun = Sector.first
			params[:sector_mun] = @sector_mun.id
			@companies_sectors_mun = Company.where("sector_id = ?", params[:sector_mun])
		end

		Company.where("sector_id = ?", params[:sector_mun]).group_by(&:activity).each do |activity, company_sectors|
			@company_activities.push(activity)
		end

		Municipio.all.each do |municipio|
			@company_activities.each do |activity|
				@companies_asm = Company.where("sector_id = ? AND municipio_id = ? AND activity_id = ?", @sector_mun.id, municipio.id, activity.id)
				if @companies_asm.length > 0
					@company_am.push([activity, @companies_asm.length, @sector_mun, municipio])
				end
			end
		end
		@company_am = @company_am.sort{ |a,b| b[1] <=> a[1]}
		count_company = 0
		@company_am.each do |companies_list|
			if count_company > 4
				break
			end
			@company_am_2.push(companies_list)
			count_company = count_company + 1
		end

	end

	def company_regional_user
		@user = current_user
		@municipios_all = []
		if @user.company
			@sector = @user.company.sector
			@municipios_all = Municipio.all
			@companies_sectors = Company.where("sector_id = ?", @sector.id)
		end
	end

	def company_municipal_user
		@user = current_user
		@municipios_all = []
		@company_am = []
		@company_am_2 = []
		@company_activities = []
		if @user.company
			@sector = @user.company.sector
			@municipios_all = Municipio.all
			@companies_sectors = Company.where("sector_id = ?", @sector.id)

			Company.where("sector_id = ?", @sector.id).group_by(&:activity).each do |activity, company_sectors|
				@company_activities.push(activity)
			end
			Municipio.all.each do |municipio|
				@company_activities.each do |activity|
					@companies_asm = Company.where("sector_id = ? AND municipio_id = ? AND activity_id = ?", @sector.id, municipio.id, activity.id)
					if @companies_asm.length > 0
						@company_am.push([activity, @companies_asm.length, @sector, municipio])
					end
				end
			end
			@company_am = @company_am.sort{ |a,b| b[1] <=> a[1]}
		end
	end

	def company_regional_admin
		if params[:locationr_region]
			if params[:locationr_region].length > 0
				@municipios_all = Municipio.where("region_id = ?",params[:locationr_region])
			else
				@municipios_all = Municipio.all
			end
		else
			@municipios_all = Municipio.all
		end
	end

	def company_municipal_admin
		@company_am = []
		@company_am_2 = []
		@company_activities = []
		
		if params[:sector_mun]
			@sector_mun = Sector.find(params[:sector_mun])
			@companies_sectors_mun = Company.where("sector_id = ?", params[:sector_mun])
		else
			@sector_mun = Sector.first
			params[:sector_mun] = @sector_mun.id
			@companies_sectors_mun = Company.where("sector_id = ?", params[:sector_mun])
		end

		Company.where("sector_id = ?", params[:sector_mun]).group_by(&:activity).each do |activity, company_sectors|
			@company_activities.push(activity)
		end

		Municipio.all.each do |municipio|
			@company_activities.each do |activity|
				@companies_asm = Company.where("sector_id = ? AND municipio_id = ? AND activity_id = ?", @sector_mun.id, municipio.id, activity.id)
				if @companies_asm.length > 0
					@company_am.push([activity, @companies_asm.length, @sector_mun, municipio])
				end
			end
		end
		@company_am = @company_am.sort{ |a,b| b[1] <=> a[1]}
	end

	def business_directory_user
		@user = current_user
		@sector = false
		if @user.company
			@sector = @user.company.sector
			if params[:search]
				if params[:search].length > 0
					@companies = Company.where("sector_id = ? AND company_name LIKE ?", @sector.id,params[:search])
				else
					@companies = Company.where("sector_id = ?", @sector.id)
				end
			else
				@companies = Company.where("sector_id = ?", @sector.id)
			end
		end
	end

	def business_directory_admin
		if params[:sector]
			if params[:sector].length > 0
				if params[:search]
					if params[:search].length > 0
						@companies = Company.where("sector_id = ? AND company_name LIKE ?", params[:sector],params[:search])
					else
						@companies = Company.where("sector_id = ?", params[:sector])
					end
				else
					@companies = Company.where("sector_id = ?", params[:sector])
				end
			else
				if params[:search]
					if params[:search].length > 0
						@companies = Company.where("company_name LIKE ?", params[:search])
					else
						@companies = Company.all
					end
				else
					@companies = Company.all
				end
			end
		else
			if params[:search]
				if params[:search].length > 0
					@companies = Company.where("company_name LIKE ?", params[:search])
				else
					@companies = Company.all
				end
			else
				@companies = Company.all
			end
		end
	end
end

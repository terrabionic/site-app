class HomeController < ApplicationController
	def index
	end

	def about_us
		@login_manager = LoginManager.first
		unless @login_manager
			@login_manager = LoginManager.create()
		end
	end

	def we_do
		@login_manager = LoginManager.first
		unless @login_manager
			@login_manager = LoginManager.create()
		end
	end

	def contact
		@login_manager = LoginManager.first
		unless @login_manager
			@login_manager = LoginManager.create()
		end
	end

	def privacy
		@login_manager = LoginManager.first
		unless @login_manager
			@login_manager = LoginManager.create()
		end
	end
end

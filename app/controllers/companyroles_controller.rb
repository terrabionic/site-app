class CompanyrolesController < ApplicationController

	def index_emprered
		@companies = Company.all
	end

	def show_reply
	    @user = current_user
	    #redirect_to root_path
	    @replies = Reply.where("user_id = ?", @user.id)
	    if @replies.length > 0
	      redirect_to survey_reply_path(survey_id:@replies[0].survey, id: @replies[0])
	    else
	      @survey = Survey.first
	      redirect_to new_survey_reply_path(survey_id:@survey)
	    end
	    
	    #@company = @user.companies.build(company_params)
  end

end

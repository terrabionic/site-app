class RepliesController < ApplicationController
  before_action :set_survey
  before_action :set_reply, only:[:edit, :update, :destroy, :show]

  def index
  end

  def new
    @reply = @survey.replies.new
    @categories= get_categories(@survey)
    @survey.questions.each { |question| @reply.answers.build(question: question) }
  end

  def create
    @reply = @survey.replies.build(reply_params)
    if @reply.save
      @reply.user = current_user
      @reply.save
      redirect_to survey_reply_path(@survey, @reply), notice: 'Reply was successfully created.'
    else
      render :new
    end
  end

  def edit
	 @categories = get_categories(@survey)
  end

  def update
    if @reply.update_attributes(reply_params)
      redirect_to survey_reply_path(@survey, @reply), notice: 'Reply was successfully updated.'
    else
      render :edit
    end

  end

  def show
    @categories = get_categories(@survey)
  end
  
  def get_categories(survey)
	#~ @company_ids = Company.where("user_login_id = ?", self.id)
	@categories = Question.where("survey_id = ?",survey).map{|s| s.category}
	if @categories
		@categories = @categories.uniq
		return @categories
	end
	return false
  end

  private
    def reply_params
      params.require(:reply).permit(:id, :user_id, :survey_id, {
        answers_attributes: [:id, :reply_id, :question_id, :possible_answer_id]
      })
    end

    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    def set_reply
      @reply = @survey.replies.find(params[:id])
    end

end

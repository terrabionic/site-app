class RepliesController < ApplicationController
  before_action :set_survey
  before_action :set_reply, only:[:edit, :update, :destroy, :show]

  def index
  end

  def new
    @reply = @survey.replies.new
    @survey.questions.each { |question| @reply.answers.build(question: question) }
  end

  def create
    @reply = @survey.replies.build(reply_params)
    if @reply.save
      @reply.user = current_user
      @reply.save
      redirect_to survey_replies_url(@survey), notice: 'Reply was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reply.update_attributes(reply_params)
      redirect_to survey_replies_url(@survey), notice: 'Reply was successfully updated.'
    else
      render :edit
    end

  end

  def show
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

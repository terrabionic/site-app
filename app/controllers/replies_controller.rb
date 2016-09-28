class RepliesController < ApplicationController
  def index
    @survey = Survey.find(params[:survey_id])
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @reply = @survey.replies.new
    @survey.questions.each { |question| @reply.answers.build(question: question) }
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @reply = @survey.replies.build(reply_params)
    if @reply.save
      redirect_to survey_replies_url(@survey), notice: 'Reply was successfully created.'
    else
      render :new
    end
  end

  def edit
    @survey = Survey.find(params[:survey_id])
    @reply = @survey.replies.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:survey_id])
    @reply = @survey.replies.find(params[:id])

    if @reply.update_attributes(reply_params)
      redirect_to survey_replies_url(@survey), notice: 'Reply was successfully updated.'
    else
      render :edit
    end

  end

  private
    def reply_params
      params.require(:reply).permit(:id, :survey_id, {
        answers_attributes: [:id, :content, :reply_id, :question_id]
      })
    end

end

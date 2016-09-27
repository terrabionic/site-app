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
    @reply = @survey.replies.new(reply_params)
    if @reply.save
      redirect_to survey_replies_url(@survey), notice: 'Reply was successfully created.'
    else
      render :new
    end
  end

  private
    def reply_params
      params.require(:reply).permit(:poll_id, {
        answers_attributes: [:content, :reply_id, :question_id]
      })
    end

end

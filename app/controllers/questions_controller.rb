class QuestionsController < ApplicationController
  before_action :set_survey

  def index
  end

  def new
    @question = @survey.questions.new

  end

  def create
    @question = @survey.questions.new(question_params)
    if @question.save
      redirect_to survey_questions_path(@survey), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  private
    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    def question_params
      params.require(:question).permit(:title, :value)
    end

end

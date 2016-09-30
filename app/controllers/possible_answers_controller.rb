class PossibleAnswersController < ApplicationController
  before_action :set_question

  def index
  end

  def new
    @possible_answer = @question.possible_answers.new
  end

  def create
    @possible_answer = @question.possible_answers.new(possible_answer_params)
    if @possible_answer.save
      redirect_to question_possible_answers_url(@question), notice: 'Possible answer was successfully created.'
    else
      render :new
    end
  end

  private
    def set_question
      @question = Question.find(params[:question_id])
    end

    def possible_answer_params
      params.require(:possible_answer).permit(:title, :grade, :description)
    end

end

class PossibleAnswersController < ApplicationController
  before_action :set_question
  before_action :set_possible_answer, only:[:edit, :update, :destroy]

  def index
  end

  def new
    @possible_answer = @question.possible_answers.new
  end

  def create
    @possible_answer = @question.possible_answers.new(possible_answer_params)
    if @possible_answer.save
      redirect_to question_possible_answers_url(@question), notice: 'La Posible respuesta se ha creado correctamente.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @possible_answer.update(possible_answer_params)
      redirect_to question_possible_answers_url(@question), notice: 'La Posible respuesta fue actializada correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @possible_answer.destroy
    redirect_to question_possible_answers_url(@question), notice: 'La Posible respuesta fue eliminada correctamente.'
  end

  private
    def set_question
      @question = Question.find(params[:question_id])
    end

    def possible_answer_params
      params.require(:possible_answer).permit(:title, :grade, :description)
    end

    def set_possible_answer
      @possible_answer = @question.possible_answers.find(params[:id])
    end

end

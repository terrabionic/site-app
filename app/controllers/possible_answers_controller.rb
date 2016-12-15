class PossibleAnswersController < ApplicationController
  before_action :set_question
  before_action :set_possible_answer, only:[:edit, :update, :destroy]
  
  add_breadcrumb "Inicio", :root_path

  def index
	add_breadcrumb "Diagnósticos", surveys_path
	add_breadcrumb "Preguntas", survey_questions_path(survey_id: @question.survey)
	add_breadcrumb "Posibles Respuestas", question_possible_answers_path(question_id: @question)
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
	add_breadcrumb "Diagnósticos", surveys_path
	add_breadcrumb "Preguntas", survey_questions_path(survey_id: @question.survey)
	add_breadcrumb "Posibles Respuestas", question_possible_answers_path(question_id: @question)
	add_breadcrumb "Editar " + @possible_answer.title, edit_question_possible_answer_path(question_id: @question, id:@possible_answer)
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
      params.require(:possible_answer).permit(:title, :grade, :description, :solution)
    end

    def set_possible_answer
      @possible_answer = @question.possible_answers.find(params[:id])
    end

end

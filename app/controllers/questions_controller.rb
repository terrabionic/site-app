class QuestionsController < ApplicationController
  before_action :set_survey
  before_action :set_question, only:[:edit, :update, :destroy]
  
  add_breadcrumb "Inicio", :root_path

  def index
	add_breadcrumb "Diagnósticos", surveys_path
	add_breadcrumb "Preguntas", survey_questions_path(survey_id: @survey)
  end

  def new
    @question = @survey.questions.new
    add_breadcrumb "Diagnósticos", surveys_path
	add_breadcrumb "Preguntas", survey_questions_path(survey_id: @survey)
  end

  def create
    @question = @survey.questions.new(question_params)
    if @question.save
      redirect_to survey_questions_url(@survey), notice: 'La Pregunta se ha creado correctamente.'
    else
      render :new
    end
  end

  def edit
	add_breadcrumb "Diagnósticos", surveys_path
	add_breadcrumb "Preguntas", survey_questions_path(survey_id: @survey)
	add_breadcrumb "Editar " + @question.title, edit_survey_question_path(survey_id: @survey)
  end

  def update
    if @question.update(question_params)
      redirect_to survey_questions_url(@survey), notice: 'La Pregunta fue actualizada correctamente.'
    else
      render :edit
    end

  end

  def destroy
    @question.destroy
    redirect_to survey_questions_url(@survey), notice: 'La Pregunta fue eliminada correctamente.'
  end

  private
    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    def question_params
      params.require(:question).permit(:title, :grade, :category_id)
    end

    def set_question
      @question = @survey.questions.find(params[:id])
    end

end

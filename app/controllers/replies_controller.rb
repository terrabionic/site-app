class RepliesController < ApplicationController
  before_action :set_survey
  before_action :set_reply, only:[:edit, :update, :destroy, :show, :score_category]
  
  add_breadcrumb "Home", :root_path

  def index
	add_breadcrumb "Diagnósticos", surveys_path
	add_breadcrumb "Respuestas", survey_questions_path(survey_id: @survey)
  end

  def new
    @reply = @survey.replies.new
    @categories= get_categories(@survey)
    @survey.questions.each { |question| @reply.answers.build(question: question) }
  end

  def create
    @reply = @survey.replies.build(reply_params)
    if @reply.save
      done = true
      @reply.answers.each do |answer|
        unless answer.grade.to_f > 0
           done = false
        end
      end
      if done == true
        @company = current_user.company
        if @company
          @company.done = true
          @company.save
        end
        @reply.done = true
      end
      @reply.user = current_user
      @reply.save
      redirect_to index_company_path, notice: 'La Encuesta se ha creado correctamente.'
    else
      render :new
    end
  end

  def edit
	@categories = get_categories(@survey)
  end

  def update
    if @reply.update_attributes(reply_params)
      done = true
      @reply.answers.each do |answer|
        unless answer.grade.to_f > 0
           done = false
        end
      end
      if done == true
        @company = current_user.company
        if @company
          @company.done = true
          @company.save
        end
        @reply.done = true
      end
      @reply.save
      redirect_to survey_reply_path(@survey, @reply), notice: 'La Pregunta fue actualizada correctamente.'
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
      #@reply = @survey.replies.find(params[:id])
      @reply = Reply.find(params[:id])
    end

end

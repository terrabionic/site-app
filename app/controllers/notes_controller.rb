class NotesController < ApplicationController
  before_action :set_question

  def index
  end

  def new
    @note = @question.notes.new
  end

  def create
    @note = @question.notes.new(note_params)
    if @note.save
      redirect_to question_notes_url(@question), notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  private
    def note_params
      params.require(:note).permit(:title, :description, :points)
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

end

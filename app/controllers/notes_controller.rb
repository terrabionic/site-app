class NotesController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
  end

  def new
    @question = Question.find(params[:question_id])
    @note = @question.notes.new
  end

  def create
    @question = Question.find(params[:question_id])
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

end

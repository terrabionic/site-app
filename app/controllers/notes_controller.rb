class NotesController < ApplicationController
  before_action :set_question
  before_action :set_note, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to question_notes_url(@question), notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to question_notes_url(@question), notice: 'Note was successfully destroyed.'
  end

  private
    def note_params
      params.require(:note).permit(:title, :description, :points)
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_note
      @note = @question.notes.find(params[:id])
    end

end

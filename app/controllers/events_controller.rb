class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb "Inicio", :root_path

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    add_breadcrumb 'Cursos', events_path
  end

  # GET /events/1
  # GET /events/1.json
  def show
  add_breadcrumb 'Cursos', events_path
  add_breadcrumb @event.title, event_path(@event)
  end

  # GET /events/new
  def new
    @event = Event.new
    authorize! :create, @event
  end

  # GET /events/1/edit
  def edit
  authorize! :update, @event
  add_breadcrumb 'Cursos', events_path
  add_breadcrumb 'Editar ' + @event.title, edit_event_path(@event)
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :start_at, :end_at, :allDay, :name_exhibitor, :level_id, :hours, :price)
    end
end

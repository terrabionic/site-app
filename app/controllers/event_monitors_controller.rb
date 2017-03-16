class EventMonitorsController < ApplicationController
  before_action :set_event_monitor, only: [:show, :edit, :update, :destroy]

  # GET /event_monitors
  # GET /event_monitors.json
  def index
    @event_monitors = EventMonitor.all
  end

  # GET /event_monitors/1
  # GET /event_monitors/1.json
  def show
  end

  # GET /event_monitors/new
  def new
    @event_monitor = EventMonitor.new
    authorize! :create, @event_monitor
  end

  # GET /event_monitors/1/edit
  def edit
    authorize! :update, @event_monitor
  end

  # POST /event_monitors
  # POST /event_monitors.json
  def create
    @event_monitor = EventMonitor.new(event_monitor_params)
    @users = User.all
    @users.each do |user|
      if user.company
        notifications_params = { title: @event_monitor.title, event: @event_monitor, user_read: false, date_pub: Time.now, user_id: user.id }
        Notification.create(notifications_params)
      end
    end
    
    respond_to do |format|
      if @event_monitor.save
        format.html { redirect_to @event_monitor, notice: 'Event monitor was successfully created.' }
        format.json { render :show, status: :created, location: @event_monitor }
      else
        format.html { render :new }
        format.json { render json: @event_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_monitors/1
  # PATCH/PUT /event_monitors/1.json
  def update
    respond_to do |format|
      if @event_monitor.update(event_monitor_params)
        format.html { redirect_to @event_monitor, notice: 'Event monitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_monitor }
      else
        format.html { render :edit }
        format.json { render json: @event_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_monitors/1
  # DELETE /event_monitors/1.json
  def destroy
    @event_monitor.destroy
    respond_to do |format|
      format.html { redirect_to event_monitors_url, notice: 'Event monitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_monitor
      @event_monitor = EventMonitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_monitor_params
      params.require(:event_monitor).permit(:title, :start_at, :end_at, :allDay, :address, :website)
    end
end

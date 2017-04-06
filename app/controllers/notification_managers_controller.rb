class NotificationManagersController < ApplicationController
  before_action :set_notification_manager, only: [:show, :edit, :update, :destroy]

  # GET /notification_managers
  # GET /notification_managers.json
  def index
    num_page = 20
    unless params[:type].blank?
       if params[:type] == 'events'
        @notification_managers = NotificationManager.where('notice_id is NULL',).order("created_at DESC").paginate(:page => params[:page], :per_page => num_page)
       elsif params[:type] == 'notice'
        @notification_managers = NotificationManager.where('event_id is NULL',).order("created_at DESC").paginate(:page => params[:page], :per_page => num_page)
       end
    else
      @notification_managers = NotificationManager.all.order("created_at DESC").paginate(:page => params[:page], :per_page => num_page)
    end 
    

  end

  # GET /notification_managers/1
  # GET /notification_managers/1.json
  def show
  end

  # GET /notification_managers/new
  def new
    @notification_manager = NotificationManager.new
  end

  # GET /notification_managers/1/edit
  def edit

  end

  # POST /notification_managers
  # POST /notification_managers.json
  def create   
    @notification_manager = NotificationManager.new(notification_manager_params)

    respond_to do |format|
      if @notification_manager.save
        format.html { redirect_to @notification_manager, notice: 'Notification manager was successfully created.' }
        format.json { render :show, status: :created, location: @notification_manager }
      else
        format.html { render :new }
        format.json { render json: @notification_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification_managers/1
  # PATCH/PUT /notification_managers/1.json
  def update
    respond_to do |format|
      if @notification_manager.update(notification_manager_params)
        format.html { redirect_to @notification_manager, notice: 'Notification manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification_manager }
      else
        format.html { render :edit }
        format.json { render json: @notification_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_managers/1
  # DELETE /notification_managers/1.json
  def destroy
    @notification_manager.destroy
    respond_to do |format|
      format.html { redirect_to notification_managers_url, notice: 'Notification manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def send_notification
    @notificationm = NotificationManager.find(params[:notificationm_id])
    @notificationm.active = true
    @notificationm.date_pub = Time.now
    @notificationm.save
    
    @companies = Company.where('sector_id = ?', @notificationm.sector.id)
    @companies.each do |company|
      if company.user_login
        unless @notificationm.notice.blank?
          notifications_params = { title: @notificationm.title, notice_id: @notificationm.notice.id, user_read: false, date_pub: Time.now, user_id: company.user_login.id }
        else
          notifications_params = { title: @notificationm.title, event_id: @notificationm.event.id, user_read: false, date_pub: Time.now, user_id: company.user_login.id }
        end
        Notification.create(notifications_params)
      end
    end
    @notificacion_managers = NotificationManager.all
    respond_to do |format|
      format.html { redirect_to notification_managers_path(@notificacion_managers) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_manager
      @notification_manager = NotificationManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_manager_params
      params.require(:notification_manager).permit(:title, :event_id, :notice_id, :date_pub, :sector_id)
    end
end

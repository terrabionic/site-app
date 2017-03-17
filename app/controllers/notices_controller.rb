class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy], except: [:index_notice_user]

  # GET /notices
  # GET /notices.json
  def index
    @notices = Notice.all
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  def new
    @notice = Notice.new
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(notice_params)

    respond_to do |format|
      if @notice.save
        format.html { redirect_to @notice, notice: 'Notice was successfully created.' }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to @notice, notice: 'Notice was successfully updated.' }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to notices_url, notice: 'Notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def publish_notice
    @notice = Notice.find(params[:notice_id])
    @notice.active = true
    @notice.save
    
    @companies = Company.where('sector_id = ?', @notice.sector.id)
    @companies.each do |company|
      if company.user_login
        notifications_params = { title: @notice.title, notice: @notice, user_read: false, date_pub: Time.now, user_id: company.user_login.id }
        Notification.create(notifications_params)
      end
    end
    @notices = Notice.all
    respond_to do |format|
      format.html { redirect_to notices_path(@notices) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit(:title, :link, :sector_id, :description, :active, :date_pub, :image_notice)
    end
end
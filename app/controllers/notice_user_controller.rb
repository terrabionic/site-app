class NoticeUserController < ApplicationController

  def index_notice_user_first10
  	@user = current_user
    @notices = []
    if current_user.is? 'admin'
      @notices = Notice.where('active = ?',true).limit(10).order("updated_at ASC")
    else
      if @user.company
        @notices = Notice.where('sector_id = ? AND active = ?',@user.company.sector.id,true).limit(10).order("updated_at ASC")
      end
    end
  end

  def index_notice_user
  	@user = current_user
    @notices = []
    if current_user.is? 'admin'
      @notices = Notice.where('active = ?',true).order("updated_at ASC")
    else
    	if @user.company
    		@notices = Notice.where('sector_id = ? AND active = ?',@user.company.sector.id,true).order("updated_at ASC")
    	else
    		@notices = []
    	end
    end
  end
end

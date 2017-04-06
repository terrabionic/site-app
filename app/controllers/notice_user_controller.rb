class NoticeUserController < ApplicationController
  add_breadcrumb "Inicio", :root_path

  def index_notice_user_first10
  	@user = current_user
    @notices = []
    @priority_notices = []
    @events = []
    if current_user.is? 'admin'
      add_breadcrumb "Monitor Empresarial", index_manager_admin_path
      add_breadcrumb "Noticias destacadas", index_notice_user_first10_path
      @notices = Notice.where('active = ? AND priority = ?',true,false).limit(10).order("updated_at ASC")
      @priority_notices = Notice.where('active = ? AND priority = ?',true,true).limit(10).order("updated_at ASC")
    else
      add_breadcrumb "Monitor Empresarial", index_manager_user_path
      add_breadcrumb "Noticias destacadas", index_notice_user_first10_path
      if @user.company
        @notices = Notice.where('sector_id = ? AND active = ? AND priority = ?',@user.company.sector.id,true,false).limit(10).order("updated_at ASC")
        @priority_notices = Notice.where('sector_id = ? AND active = ? AND priority = ?',@user.company.sector.id,true,true).limit(10).order("updated_at ASC")
      end
    end
    @events = EventMonitor.limit(10)
  end

  def index_notice_user
    num_page = 20
  	@user = current_user
    @notices = []
    if current_user.is? 'admin'
      add_breadcrumb "Monitor Empresarial", index_manager_admin_path
      add_breadcrumb "Noticias destacadas", index_notice_user_first10_path
      add_breadcrumb "Todas las noticias", index_notice_user_path

      if params[:search]
        if params[:search].length > 0
          if params[:show_notice] == 'recent'
            @notices = Notice.where('active = ? AND lower(title) LIKE lower(?)',true,"%#{params[:search]}%").limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          else
            @notices = Notice.where('active = ? AND lower(title) LIKE lower(?)',true,"%#{params[:search]}%").order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          end
        else
          if params[:show_notice] == 'recent'
            @notices = Notice.where('active = ?',true).limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          else
            @notices = Notice.where('active = ?',true).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          end
        end
      else
        if params[:show_notice] == 'recent'
          @notices = Notice.where('active = ?',true).limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
        else
          @notices = Notice.where('active = ?',true).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
        end
      end
      
    else
      add_breadcrumb "Monitor Empresarial", index_manager_user_path
      add_breadcrumb "Noticias destacadas", index_notice_user_first10_path
      add_breadcrumb "Todas las noticias", index_notice_user_path
    	if @user.company

        if params[:search]
          if params[:search].length > 0
            if params[:show_notice] == 'recent'
              @notices = Notice.where('sector_id = ? AND active = ? AND lower(title) LIKE lower(?)',@user.company.sector.id,true,"%#{params[:search]}%").limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
            else
              @notices = Notice.where('sector_id = ? AND active = ? AND lower(title) LIKE lower(?)',@user.company.sector.id,true,"%#{params[:search]}%").order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
            end
          else
            if params[:show_notice] == 'recent'
              @notices = Notice.where('sector_id = ? AND active = ?',@user.company.sector.id,true).limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
            else
              @notices = Notice.where('sector_id = ? AND active = ?',@user.company.sector.id,true).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
            end
          end
        else
          if params[:show_notice] == 'recent'
              @notices = Notice.where('sector_id = ? AND active = ?',@user.company.sector.id,true).limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          else
              @notices = Notice.where('sector_id = ? AND active = ?',@user.company.sector.id,true).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          end
        end
    	else
    		@notices = []
    	end
    end
  end

  def list_notice_user
    num_page = 20
    @user = current_user
    @notices = []
    if current_user.is? 'admin'
      add_breadcrumb "Monitor Empresarial", index_manager_admin_path
      add_breadcrumb "Noticias destacadas", index_notice_user_first10_path
      add_breadcrumb "Todas las noticias", index_notice_user_path
      if params[:search]
        if params[:search].length > 0
          if params[:show_notice] == 'recent'
            @notices = Notice.where('active = ? AND lower(title) LIKE lower(?)',true,"%#{params[:search]}%").limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          else
            @notices = Notice.where('active = ? AND lower(title) LIKE lower(?)',true,"%#{params[:search]}%").order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          end
        else
          if params[:show_notice] == 'recent'
            @notices = Notice.where('active = ?',true).limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          else
            @notices = Notice.where('active = ?',true).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          end
        end
      else
        if params[:show_notice] == 'recent'
          @notices = Notice.where('active = ?',true).limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
        else
          @notices = Notice.where('active = ?',true).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
        end
      end
      
    else
      if @user.company
        add_breadcrumb "Monitor Empresarial", index_manager_user_path
        add_breadcrumb "Noticias destacadas", index_notice_user_first10_path
        add_breadcrumb "Todas las noticias", index_notice_user_path
        if params[:search]
          if params[:search].length > 0
            if params[:show_notice] == 'recent'
              @notices = Notice.where('sector_id = ? AND active = ? AND lower(title) LIKE lower(?)',@user.company.sector.id,true,"%#{params[:search]}%").limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
            else
              @notices = Notice.where('sector_id = ? AND active = ? AND lower(title) LIKE lower(?)',@user.company.sector.id,true,"%#{params[:search]}%").order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
            end
          else
            if params[:show_notice] == 'recent'
              @notices = Notice.where('sector_id = ? AND active = ?',@user.company.sector.id,true).limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
            else
              @notices = Notice.where('sector_id = ? AND active = ?',@user.company.sector.id,true).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
            end
          end
        else
          if params[:show_notice] == 'recent'
              @notices = Notice.where('sector_id = ? AND active = ?',@user.company.sector.id,true).limit(15).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          else
              @notices = Notice.where('sector_id = ? AND active = ?',@user.company.sector.id,true).order("updated_at ASC").paginate(:page => params[:page], :per_page => num_page)
          end
        end
      else
        @notices = []
      end
    end
  end
end

class UsersController < ApplicationController

	add_breadcrumb "Inicio", :root_path

  def devise_mapping
    Devise.mappings[:user]
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end

  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 20)
    add_breadcrumb 'Usuarios', users_path
    authorize! :update, @user
  end

  def index_role
    @role = params[:role_id]
    if params[:search]
      if params[:sort]
        @users = User.search(params[:search]).where("role_id = ?", params[:role_id])
      else
        @users = User.search(params[:search]).where("role_id = ?", params[:role_id])
      end
    else
      @users = User.where("role_id = ?", params[:role_id])
    end
    #@users = User.where("role_id = ?", params[:role_id])
    #@users = User.all
    authorize! :update, @user
  end

  def new_user
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	add_breadcrumb @user.name, user_path(@user)
  end

  def edit_user
    @user = User.find(params[:id])
    add_breadcrumb @user.name, user_path(@user)
    add_breadcrumb 'Editar_' + @user.name, edit_user_path(@user)
  end

  def edit_profile
    @user = User.find(params[:id])
    add_breadcrumb @user.name, user_path(@user)
    add_breadcrumb 'Editar_' + @user.name, edit_profile_path(@user)
  end

  def edit_password
    @user = User.find(params[:id])
  end

  def edit_role_u
    @user = User.find(params[:id])
    add_breadcrumb @user.name, user_path(@user)
    add_breadcrumb 'Role ' + @user.name, edit_role_u_path(@user)
  end

  def update

    @user = User.find(params[:id])
    authorize! :update,  @user
    #params_update2 = params[:user]
    #@user.update(name: params[:user][:name], email:params[:user][:email], location:params[:user][:location])
    #@user.name = params[:user][:name]
    if params[:user][:name]
      @user.update(name:params[:user][:name])
    end
    if params[:user][:email]
      @user.update(email:params[:user][:email])
    end
    if params[:user][:location]
      @user.update(location:params[:user][:location])
    end
    if params[:user][:role_id]
      @user.update(role_id:params[:user][:role_id])
    end
    if params[:user][:password]
      @user.update(password:params[:user][:password])
      @user.update(change_password:false)
    end
    if params[:user][:current_password]
      @user.update(password:params[:user][:current_password])
    end
    if params[:user][:password_confirmation]
      @user.update(password:params[:user][:password_confirmation])
    end
    @user.save
    if params[:user][:password]
      redirect_to root_path
    else
      if current_user.is? 'admin'
        redirect_to show_user_admin_path(@user)
      else
        redirect_to root_path
      end
    end
  end

  def deactivate
    @user = User.find(params[:user_id])
    @user.active = false
    @user .save
    redirect_to show_user_admin_path(@user)
  end

  def action_activate
    @user = User.find(params[:user_id])
    @user.active = true
    @user.save
    redirect_to show_user_admin_path(@user)
  end
end

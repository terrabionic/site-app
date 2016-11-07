class UsersController < ApplicationController

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
    @users = User.all
    authorize! :update, @user
  end

  def new_user
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def edit_role
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
    if params[:user][:role]
      @user.update(role:params[:user][:role])
    end
    @user.save
    redirect_to show_user_admin_path(@user)
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
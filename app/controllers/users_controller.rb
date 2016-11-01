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

  def update
    @user = User.find(params[:id])
    @user.update(name: params[:user][:name], email:params[:user][:email], role:params[:user][:role])
    #@user.name = params[:user][:name]
    @user.save
    redirect_to show_user_admin_path(@user)
  end
end
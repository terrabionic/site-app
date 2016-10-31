class UsersController < ApplicationController

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

end
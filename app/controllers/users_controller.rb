class UsersController < ApplicationController
  def index
    @users = User.all
    render :ok, json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :ok, json: @user
    else
      render :not_found, json: {}
    end
  end
end

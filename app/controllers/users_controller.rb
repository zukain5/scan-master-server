class UsersController < ApplicationController
  def index
    @users = User.all.includes(:orders)
    render :ok, json: @users, methods: :points
  end

  def show
    @user = User.find(params[:id]).includes(:orders)
    render :ok, json: @user, methods: :points
  end
end

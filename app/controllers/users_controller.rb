class UsersController < ApplicationController
  def index
    @users = User.all.includes(:orders)
    render :ok, json: @users, methods: :points
  end

  def show
    @user = User.find(params[:id])
    render :ok, json: @user, methods: :points
  end

  def create
    user = User.new(name: params[:name])
    if user.save
      render status: :ok, json: user, methods: :points
    else
      render status: :internal_server_error, nothing: true
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render status: :no_content, nothing: true
    else
      render status: :internal_server_error, nothing: true
    end
  end
end

class HistoriesController < ApplicationController
  def show
    user = User.find(params[:user_id])
    histories = Order.where(user:)
    render status: :ok, json: { 'orders': histories }
  end
end

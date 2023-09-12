class HistoriesController < ApplicationController
  def show
    user = User.find(params[:user_id])
    histories = Order.where(user:)
    render status: :ok, json: { 'orders': histories.as_json(include: :order_items) }
  end
end

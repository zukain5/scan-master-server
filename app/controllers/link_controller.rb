class LinkController < ApplicationController
  def create
    order = Order.find(params[:order_id])
    user = User.find(params[:user_id])
    if order.update(user:)
      render status: :ok, json: order
    else
      render status: :internal_server_error, nothing: true
    end
  end
end

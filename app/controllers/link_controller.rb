class LinkController < ApplicationController
  def create
    order = Order.find(params[:order_id])
    user = User.find(params[:user_id])

    return render status: :conflict, json: { 'error': 'The order is already linked with a certain user.' } if order.user

    if order.update(user:)
      render status: :ok, json: order
    else
      render status: :internal_server_error, nothing: true
    end
  end
end

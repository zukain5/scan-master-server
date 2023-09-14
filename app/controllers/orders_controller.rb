class OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc)
    render status: :ok, json: @orders, methods: :order_items
  end

  def show
    order = Order.find_by(id: params[:id])
    if order
      render status: :ok, json: order, methods: :order_items
    else
      render status: :not_found, nothing: true
    end
  end

  def create
    store = Store.find(params[:store_id])
    order = Order.new(
      store:,
      total_points: params[:total_points],
    )
    order.user = User.find(params[:user_id]) if params[:user_id]
    order_items = params[:order_items].map do |item|
      product = Product.find(item[:product_id])
      {
        product:,
        quantity: item[:quantity],
      }
    end
    order.order_items.build(order_items)
    order.save
    render status: :ok, json: order, methods: :order_items
  end

  def destroy
    user = User.find(params[:user_id])
    orders = Order.where(user:)
    if orders.destroy_all
      render status: :no_content, nothing: true
    else
      render status: :internal_server_error, nothing: true
    end
  end
end

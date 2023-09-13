class OrdersController < ApplicationController
  def index
    @orders = Order.all
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
      {
        product_id: item[:product_id],
        quantity: item[:quantity],
      }
    end
    order.order_items.build(order_items)
    order.save
    render status: :ok, json: order, methods: :order_items
  end
end

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
    order = Order.new(
      store_id: params[:store_id],
      total_points: params[:total_points],
    )
    order.user_id = params[:user_id] if params[:user_id]
    order_items = params[:order_items].map do |item|
      {
        product_id: item[:product_id],
        quantity: item[:quantity],
      }
    end
    order.order_items.build(order_items)
    order.save
    Remind.create_from_order(order)
    render status: :ok, json: order, methods: :order_items
  end
end

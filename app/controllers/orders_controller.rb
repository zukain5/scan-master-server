class OrdersController < ApplicationController
  def create
    @order = Order.new(
      store_id: params[:store_id],
      user_id: params[:user_id],
      total_points: params[:total_points],
    )
    order_items = params[:items].map do |item|
      {
        product_id: item[:product_id],
        quantity: item[:quantity],
      }
    end
    @order.order_items.build(order_items)
    @order.save
    render status: :ok, json: @order, methods: :order_items
  end
end

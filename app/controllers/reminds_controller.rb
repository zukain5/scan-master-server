class RemindsController < ApplicationController
  def show
    user = User.find(params[:user_id])
    items = Order.where(user:).map(&:order_items).flatten
    reminds = items.map do |item|
      next unless item.product.duration_days

      Remind.new(
        user_id: user.id,
        product_id: item.product.id,
        remind_at: item.created_at + item.product.duration_days.days,
      )
    end.compact

    render status: :ok, json: reminds
  end
end

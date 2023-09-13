class Remind < ApplicationRecord
  belongs_to :user
  belongs_to :product

  class << self
    def create_from_order(order)
      return unless order.user

      products = order.order_items.map(&:product)
      products.each do |product|
        next unless product.duration_days

        Remind.create(
          user_id: order.user_id,
          product_id: product.id,
          remind_at: order.created_at + product.duration_days.days,
        )
      end
    end
  end
end

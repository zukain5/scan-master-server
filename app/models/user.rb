class User < ApplicationRecord
  has_many :orders, dependent: :nullify

  def points
    orders.sum(&:total_points)
  end
end

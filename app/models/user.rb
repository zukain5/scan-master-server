class User < ApplicationRecord
  has_many :orders, dependent: :nullify
  has_many :reviews, dependent: :destroy

  def points
    orders.sum(&:total_points)
  end
end

class Remind
  include ActiveModel::Model

  attr_accessor :user_id, :product_id, :remind_at

  validates :user_id, :product_id, :remind_at, presence: true
end

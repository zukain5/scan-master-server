class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :store
  has_many :order_items
end

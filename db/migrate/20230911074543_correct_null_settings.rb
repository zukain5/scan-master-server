class CorrectNullSettings < ActiveRecord::Migration[7.0]
  def change
    change_column :order_items, :quantity, :integer, null: false
    change_column :orders, :total_points, :integer, null: false
    change_column :orders, :user_id, :bigint, null: true
    change_column :products, :name, :string, null: false
    change_column :products, :price, :integer, null: false
    change_column :stores, :name, :string, null: false
  end
end

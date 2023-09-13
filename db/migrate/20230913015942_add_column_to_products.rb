class AddColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :is_ec, :boolean, null: false, default: false
  end
end

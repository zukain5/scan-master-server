class AddDurationColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :duration_days, :integer, null: true
  end
end

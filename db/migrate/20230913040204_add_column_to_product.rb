class AddColumnToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :image_url, :string, null: true
  end
end

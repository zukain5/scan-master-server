class ChangeColumnToReminds < ActiveRecord::Migration[7.0]
  def up
    change_column :reminds, :remind_at, :datetime, null: false
  end

  def down
    change_column :reminds, :remind_at, :datetime, null: true
  end
end

class CreateReminds < ActiveRecord::Migration[7.0]
  def change
    create_table :reminds do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :remind_at
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

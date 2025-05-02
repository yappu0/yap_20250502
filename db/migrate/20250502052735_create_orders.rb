class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.date :delivery_on, null: false
      t.string :delivery_time_zone, null: false
      t.string :status, null: false
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end

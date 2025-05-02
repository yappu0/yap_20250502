class CreateSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true, index: false

      t.timestamps
    end
    add_index :subscriptions, %i[plan_id user_id], unique: true
  end
end

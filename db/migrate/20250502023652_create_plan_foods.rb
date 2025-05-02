class CreatePlanFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :plan_foods do |t|
      t.references :plan, null: false, foreign_key: true, index: false
      t.references :food, null: false, foreign_key: true
      t.integer :amount, null: false, default: 0

      t.timestamps
    end
    add_index :plan_foods, %i[plan_id food_id], unique: true
  end
end

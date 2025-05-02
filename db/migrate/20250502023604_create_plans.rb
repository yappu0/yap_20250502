class CreatePlans < ActiveRecord::Migration[8.0]
  def change
    create_table :plans do |t|
      t.string :name, null: false, default: ''
      t.text :description
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end

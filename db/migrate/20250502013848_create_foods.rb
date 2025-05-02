class CreateFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false, default: ''
      t.string :allergy
      t.boolean :freezed, null: false, default: false

      t.timestamps
    end
  end
end

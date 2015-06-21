class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :restaurant_id
      t.string  :name
      t.string  :description
      t.timestamps
    end
  end
end
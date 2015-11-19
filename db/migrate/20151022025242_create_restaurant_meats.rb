class CreateRestaurantMeats < ActiveRecord::Migration
  def change
    create_table :restaurant_meats do |t|
      t.integer  :restaurant_id
      t.integer :source_meat_id
      t.index :restaurant_id
      t.index :source_meat_id
      t.text :description
    end
  end
end

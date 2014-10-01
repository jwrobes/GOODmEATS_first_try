class CreateRestaurantmeats < ActiveRecord::Migration
  def change
    create_table :restaurantmeats do |t|
    	t.string :restaurant_id
    	t.string :meat_id
    	t.string :sourcemeat_id
    	t.text :description
    end
  end
end

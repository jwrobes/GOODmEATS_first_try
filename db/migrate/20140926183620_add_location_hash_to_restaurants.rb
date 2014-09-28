class AddLocationHashToRestaurants < ActiveRecord::Migration
  def up
  	add_column :restaurants, :location, :hstore
  end

  def down
  	remove_column :restaurants, :location, :hstore
  end
end

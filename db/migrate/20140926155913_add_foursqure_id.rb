class AddFoursqureId < ActiveRecord::Migration
  def up
  	add_column :restaurants, :foursquare_id, :string
  end

  def down
  	remove_column :restaurants, :foursquare_id
  end
end

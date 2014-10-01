class CreateSourcemeats < ActiveRecord::Migration
  def change
    create_table :sourcemeats do |t|
    	t.string :meat_id
    	t.string :source_id
    	t.text :description
    end
  end
end

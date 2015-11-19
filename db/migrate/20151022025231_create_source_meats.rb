class CreateSourceMeats < ActiveRecord::Migration
  def change
    create_table :source_meats do |t|
      t.integer :source_id
      t.integer :meat_id
      t.index :source_id
      t.index :meat_id
      t.string :name
      t.text :description
      t.integer :rating, limit: 2, null: true
    end
  end
end

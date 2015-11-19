class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
    end
  end
end

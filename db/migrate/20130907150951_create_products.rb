class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer "index", :null=>false
      t.string "title" , :null=>false

      t.timestamps
    end
  end
  
  
  def self.down
  drop_table :products
  end
end

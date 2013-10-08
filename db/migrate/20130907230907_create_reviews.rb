class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer "index" ,:null=>false
      t.integer "product_id", :null=>false
      t.string "title"  ,:limit=>25, :null=>false
      t.text "content"
      t.timestamps
    end
      
      add_index("reviews","product_id")
  end
  
  def self.down
  drop_table :reviews
  
  end
  
end

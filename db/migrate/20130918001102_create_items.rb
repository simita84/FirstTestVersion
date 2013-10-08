class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
       t.integer "index" ,:null=>false
        t.string  "name" ,:null=>false
        t.text "content" 
        t.integer "member_id", :null=>false

        t.timestamps
    end
     add_index("items","member_id")
  end
  
  def self.down
  
  drop_table :items
end

end

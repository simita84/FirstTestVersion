class AlterItems < ActiveRecord::Migration
  def self.up
    remove_index("items","member_id")
    remove_column("items","member_id")
    add_column("items","member_emailid",:integer,:null=>false)
    add_index("items","member_emailid")
      
  end

  def self.down
   remove_index("items","member_emailid") 
     remove_column("items","member_emailid")
      add_column("items","member_id")
       add_index("items","member_id")
    
  end
  
 
  
  
end

 
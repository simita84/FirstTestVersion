class AlterRecipes < ActiveRecord::Migration
  def self.up
    remove_index("recipes","member_id")
    remove_column("recipes","member_id")
    add_column("recipes","member_emailid",:integer,:null=>false)
    add_index("recipes","member_emailid")
      
  end

  def self.down
   remove_index("recipes","member_emailid") 
     remove_column("recipes","member_emailid")
      add_column("recipes","member_id")
       add_index("recipes","member_id")
    
  end
end


 
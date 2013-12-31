class RemoveIndexFromItems < ActiveRecord::Migration
  def self.up

     remove_column("items","index")
   end

   def self.down
     add_column("items","index")
   end
end

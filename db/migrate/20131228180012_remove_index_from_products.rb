class RemoveIndexFromProducts < ActiveRecord::Migration
  def self.up

     remove_column("products","index")
   end

   def self.down
     add_column("products","index")
   end
end

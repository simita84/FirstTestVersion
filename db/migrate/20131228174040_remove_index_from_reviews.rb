class RemoveIndexFromReviews < ActiveRecord::Migration
  def self.up

     remove_column("reviews","index")
   end

   def self.down
     add_column("reviews","index")
   end
end

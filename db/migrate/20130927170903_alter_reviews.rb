class AlterReviews < ActiveRecord::Migration
  def self.up
    
    add_column("reviews","member_emailid",:integer,:null=>false)
    add_index("reviews","member_emailid")
  end

  def self.down
    remove_index("reviews","member_emailid")
    remove_column("reviews","member_emailid")
    
  end
end


 



 
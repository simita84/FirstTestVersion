class AlterEmailIdInReviews < ActiveRecord::Migration
  def up
    
     remove_index("reviews","member_emailid")
      remove_column("reviews","member_emailid")
      
      add_column("reviews","member_username",:string,:null=>true)
      add_index("reviews","member_username")
  end

  def down
    
    remove_index("reviews","member_username")
    
    remove_column("reviews","member_username",:string,:null=>true)
    add_column("reviews","member_emailid",:integer,:null=>false)
    add_index("reviews","member_emailid")
    
  end
end


 
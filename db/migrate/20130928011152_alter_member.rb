class AlterMember < ActiveRecord::Migration
  def self.up
    
  remove_index("members","emailid")
    rename_column("members","emailid","username")
    add_index("members","username")
  end

  def self.down
    
    remove_index("members","username")
     rename_column("members","username","emailid")
     add_index("members","emailid")
  end
end




  

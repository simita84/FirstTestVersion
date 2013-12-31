class MappingAdminToEvent < ActiveRecord::Migration
  def self.up
        
        add_column("events","admin_username", :string,:null=>false)
        add_index("events","admin_username")
 
        
     end

   def self.down
        remove_index("events","admin_username")
      remove_column("events","admin_username")
    end
end

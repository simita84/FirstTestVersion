class AlterRecipesAddMemberName < ActiveRecord::Migration
  def self.up
    add_column("recipes","member_username",:string,:null=>false)
    add_index("recipes","member_username")
      
  end

  def self.down
    
    remove_index("recipes","member_username")
    remove_column("recipes","member_username")
  end
end
